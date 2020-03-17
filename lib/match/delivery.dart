import 'package:cricket_scorer/match/enums/extra.dart';
import 'package:cricket_scorer/match/enums/out.dart';
import 'package:cricket_scorer/match/player.dart';
import 'package:flutter/material.dart';

class Delivery with ChangeNotifier {
  int runs = 0;
  Player batter;
  Player bowler;
  var extras = [Extra.none];
  var out = Out.none;
  Player fielder;
  addBatter(Player p) {
    batter = p;
  }

  // addBowler(Player p) {
  //   bowler = p;
  // }

  addFielder(Player p) {
    fielder = p;
  }

  bool isWide() {
    return extras.contains(Extra.wide);
  }

  bool isNoBall() {
    return extras.contains(Extra.noBall);
  }

  bool isLegBye() {
    return extras.contains(Extra.legBye);
  }

  bool isBye() {
    return extras.contains(Extra.bye);
  }

  addExtra(Extra e) {
    if (e == Extra.none) {
      return;
    }
    if (extras[0] == Extra.none) {
      extras[0] = e;
      if (this.runs == 0 && e != Extra.wide && e != Extra.noBall) {
        this.runs = 1;
      }
    } else if (!Extras.allowedWith(e, extras)) {
      return;
    } else {
      extras.add(e);
      print(e);
      if (this.runs == 0 && e != Extra.wide && e != Extra.noBall) {
        this.runs = 1;
      }
    }
    notifyListeners();
  }

  addRuns(int runs) {
    this.runs += runs;
    notifyListeners();
  }

  addOut(Out out) {
    this.out = out;
  }

  finshAddOut() {
    notifyListeners();
  }

  bool validate() {
    return true;
  }

  String shortSummary() {
    var wicket = '';
    if (out != Out.none) {
      wicket = 'W';
    }
    var ext = '';
    if (extras[0] != Extra.none) {
      ext = '${extras.map((e) => Extras.shortCode(e)).join('+')}';
    }
    var tail = [wicket, ext].where((t) => t != '').join('+');
    if (tail != '' && runs == 0) {
      return tail;
    }
    return '$runs$tail';
  }

  void reset() {
    runs = 0;
    batter = null;
    bowler = null;
    extras = [Extra.none];
    out = Out.none;
    fielder = null;
  }

  bool isPenalty() {
    return extras.contains(Extra.penalty);
  }

  bool isBonus() {
    return extras.contains(Extra.bonus);
  }

  @override
  String toString() {
    return '$out $runs $bowler,$batter,$fielder  $extras';
  }
}
