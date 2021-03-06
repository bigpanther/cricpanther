import 'package:cricpanther/match/delivery.dart';
import 'package:cricpanther/match/enums/extra.dart';
import 'package:cricpanther/match/enums/out.dart';
import 'package:cricpanther/match/overs.dart';
import 'package:cricpanther/match/player.dart';
import 'package:cricpanther/match/player_picker.dart';
import 'package:flutter/material.dart';

class Scoresheet with ChangeNotifier {
  int target = 0;
  int currentRuns = 0;
  int currentWickets = 0;
  int currentBalls = 0;
  int currentNoBalls = 0;
  int currentWides = 0;
  int currentByes = 0;
  int currentLegByes = 0;
  int currentPenalty = 0;
  int currentBonus = 0;
  Player currentBowler1;
  Player currentBowler2;
  Player currentBatter1;
  Player currentBatter2;
  var isCurrentMaiden = true;
  var isOverInProgress = false;
  final PlayerPicker ballPicker;
  final PlayerPicker batPicker;

  var lastSevenDeliveries = [];

  Scoresheet({
    required this.batPicker,
    required this.ballPicker,
  })   : this.currentBatter1 = batPicker.next(),
        this.currentBatter2 = batPicker.next(),
        this.currentBowler1 = ballPicker.next(),
        this.currentBowler2 = ballPicker.next();

  void _addRuns(Delivery delivery) {
    isCurrentMaiden = false;
    if (delivery.extras[0] == Extra.none) {
      _addRunsForBatter(delivery.runs);
      _addRunsAgainstBowler(delivery.runs);
      this.currentRuns += delivery.runs;
      return;
    }
    if (delivery.isWide()) {
      this.currentRuns += delivery.runs + 1;
      this.currentWides += delivery.runs + 1;
      _addRunsAgainstBowler(delivery.runs + 1);
    }
    if (delivery.isNoBall()) {
      this.currentRuns++;
      this.currentNoBalls++;
      _addRunsAgainstBowler(1);
      if (delivery.runs > 0 && !delivery.isLegBye() && !delivery.isBye()) {
        this.currentRuns += delivery.runs;
        _addRunsForBatter(delivery.runs);
        _addRunsAgainstBowler(delivery.runs);
      }
    }
    if (delivery.isLegBye()) {
      this.currentLegByes += delivery.runs;
      this.currentRuns += delivery.runs;
    }
    if (delivery.isBye()) {
      this.currentByes += delivery.runs;
      this.currentRuns += delivery.runs;
    }
    if (delivery.isPenalty()) {
      this.currentRuns -= delivery.runs;
      this.currentPenalty += delivery.runs;
    }
    if (delivery.isBonus()) {
      this.currentRuns += delivery.runs;
      this.currentBonus += delivery.runs;
    }
  }

  void _addRunsForBatter(int runs) {
    this.currentBatter1.battingStats.runs += runs;
  }

  void _addWicket(Delivery delivery) {
    if (delivery.out == Out.none) return;
    if (delivery.out.isBowlersWicket()) {
      this.currentBowler1.bowlingStats.wickets++;
    }
    this.currentWickets++;
    if (delivery.batter == null) {
      this.currentBatter1.out = delivery.out;
      this.currentBatter1 = batPicker.next();
      return;
    }
    if (delivery.batter == this.currentBatter1) {
      this.currentBatter1.out = delivery.out;
      this.currentBatter1 = batPicker.next();
    } else {
      this.currentBatter2.out = delivery.out;
      this.currentBatter2 = batPicker.next();
    }
  }

  void _addRunsAgainstBowler(int runs) {
    this.currentBowler1.bowlingStats.runs += runs;
  }

  void _incrementBalls(Delivery delivery) {
    if (delivery.extras.isLegitBall()) {
      isOverInProgress = true;
      this.currentBalls++;
      this.currentBatter1.battingStats.balls++;
      this.currentBowler1.bowlingStats.balls++;
    }
    if (delivery.isNoBall()) {
      this.currentBatter1.battingStats.balls++;
    }
  }

  _concludeOver() {
    if (isCurrentMaiden) {
      currentBowler1.bowlingStats.maidens++;
    }
    _changeStrike();
    _changeBowler();
    isCurrentMaiden = true;
    isOverInProgress = false;
  }

  _changeStrike() {
    var t = currentBatter1;
    currentBatter1 = currentBatter2;
    currentBatter2 = t;
  }

  changeStrike() {
    _changeStrike();
    notifyListeners();
  }

  _changeBowler() {
    var t = currentBowler1;
    currentBowler1 = currentBowler2;
    currentBowler2 = t;
  }

  changeBowler(Player newBowler) {
    currentBowler1 = newBowler;
    print(currentBowler1);
    notifyListeners();
  }

  recordDelivery(Delivery delivery) {
    _addRuns(delivery);
    _incrementBalls(delivery);
    _addWicket(delivery);
    if (delivery.runs % 2 == 1 &&
        !delivery.isBonus() &&
        !delivery.isPenalty()) {
      _changeStrike();
    }
    lastSevenDeliveries.add(delivery.shortSummary());
    if (Over.finished(this.currentBalls) && isOverInProgress) {
      lastSevenDeliveries.add('|');
      _concludeOver();
    }
    while (lastSevenDeliveries.length > 7) {
      lastSevenDeliveries.removeAt(0);
    }
    delivery.reset();

    notifyListeners();
  }

  undoDelivery(Delivery delivery) {
    notifyListeners();
  }

  String overs() {
    return Over.overs(currentBalls);
  }
}
