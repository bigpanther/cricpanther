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
  })  : currentBatter1 = batPicker.next(),
        currentBatter2 = batPicker.next(),
        currentBowler1 = ballPicker.next(),
        currentBowler2 = ballPicker.next();

  void _addRuns(Delivery delivery) {
    isCurrentMaiden = false;
    if (delivery.extras[0] == Extra.none) {
      _addRunsForBatter(delivery.runs);
      _addRunsAgainstBowler(delivery.runs);
      currentRuns += delivery.runs;
      return;
    }
    if (delivery.isWide()) {
      currentRuns += delivery.runs + 1;
      currentWides += delivery.runs + 1;
      _addRunsAgainstBowler(delivery.runs + 1);
    }
    if (delivery.isNoBall()) {
      currentRuns++;
      currentNoBalls++;
      _addRunsAgainstBowler(1);
      if (delivery.runs > 0 && !delivery.isLegBye() && !delivery.isBye()) {
        currentRuns += delivery.runs;
        _addRunsForBatter(delivery.runs);
        _addRunsAgainstBowler(delivery.runs);
      }
    }
    if (delivery.isLegBye()) {
      currentLegByes += delivery.runs;
      currentRuns += delivery.runs;
    }
    if (delivery.isBye()) {
      currentByes += delivery.runs;
      currentRuns += delivery.runs;
    }
    if (delivery.isPenalty()) {
      currentRuns -= delivery.runs;
      currentPenalty += delivery.runs;
    }
    if (delivery.isBonus()) {
      currentRuns += delivery.runs;
      currentBonus += delivery.runs;
    }
  }

  void _addRunsForBatter(int runs) {
    currentBatter1.battingStats.runs += runs;
  }

  void _addWicket(Delivery delivery) {
    if (delivery.out == Out.none) return;
    if (delivery.out.isBowlersWicket()) {
      currentBowler1.bowlingStats.wickets++;
    }
    currentWickets++;
    if (delivery.batter == null) {
      currentBatter1.out = delivery.out;
      currentBatter1 = batPicker.next();
      return;
    }
    if (delivery.batter == currentBatter1) {
      currentBatter1.out = delivery.out;
      currentBatter1 = batPicker.next();
    } else {
      currentBatter2.out = delivery.out;
      currentBatter2 = batPicker.next();
    }
  }

  void _addRunsAgainstBowler(int runs) {
    currentBowler1.bowlingStats.runs += runs;
  }

  void _incrementBalls(Delivery delivery) {
    if (delivery.extras.isLegitBall()) {
      isOverInProgress = true;
      currentBalls++;
      currentBatter1.battingStats.balls++;
      currentBowler1.bowlingStats.balls++;
    }
    if (delivery.isNoBall()) {
      currentBatter1.battingStats.balls++;
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
    if (Over.finished(currentBalls) && isOverInProgress) {
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
