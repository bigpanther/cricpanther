import 'package:cricket_scorer/match/enums/extra.dart';
import 'package:cricket_scorer/match/enums/out.dart';
import 'package:cricket_scorer/match/player.dart';

class Delivery {
  int runs = 0;
  Player batter;
  Player bowler;
  var extras = [Extra.none];
  var out = Out.none;
  Player fielder;

  bool validate() {
    return true;
  }
}
