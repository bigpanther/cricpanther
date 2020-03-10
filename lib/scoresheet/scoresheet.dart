import 'package:cricket_scorer/game/delivery.dart';
import 'package:cricket_scorer/game/overs.dart';
import 'package:cricket_scorer/game/player.dart';
import 'package:cricket_scorer/game/player_picker.dart';
import 'package:flutter/material.dart';

class Scoresheet with ChangeNotifier {
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
  final PlayerPicker ballPicker;
  final PlayerPicker batPicker;

  Scoresheet(
    this.ballPicker,
    this.batPicker,
  ) {
    this.currentBatter1 = batPicker.next();
    this.currentBatter2 = batPicker.next();
    this.currentBowler1 = ballPicker.next();
    this.currentBowler2 = ballPicker.next();
  }

  addRuns(int runs) {
    isCurrentMaiden = false;
    this.currentRuns += runs;
    this.currentBatter1.runsScored += runs;
    this.currentBowler1.runsConceded += runs;
    if (runs % 2 == 1) {
      var t = currentBatter1;
      currentBatter1 = currentBatter2;
      currentBatter2 = t;
    }

    notifyListeners();
  }

  addWicket() {
    this.currentBowler1.wicketsTaken++;
    this.currentWickets++;
    this.currentBatter1 = batPicker.next();
    notifyListeners();
  }

  addBall() {
    this.currentBalls++;
    this.currentBatter1.ballsFaced++;
    this.currentBowler1.ballsBowled++;
    if (Over.finished(currentBalls)) {
      concludeOver();
    } else
      notifyListeners();
  }

  concludeOver() {
    if (isCurrentMaiden) {
      currentBowler1.maidensBowled++;
    }
    changeStrike();
    changeBowler();
    isCurrentMaiden = true;
    notifyListeners();
  }

  changeStrike() {
    var t = currentBatter1;
    currentBatter1 = currentBatter2;
    currentBatter2 = t;
    t = currentBowler1;
  }

  changeBowler() {
    var t = currentBowler1;
    currentBowler1 = currentBowler2;
    currentBowler2 = t;
  }

  recordDelivery(Delivery delivery) {
    notifyListeners();
  }

  undoDelivery(Delivery delivery) {
    notifyListeners();
  }

  String overs() {
    return Over.overs(currentBalls);
  }
}
