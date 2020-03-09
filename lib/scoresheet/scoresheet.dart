import 'package:cricket_scorer/game/player.dart';

class Scoresheet {
  int currentRuns = 0;
  int currentWickets = 0;
  int currentBalls = 0;
  int currentNoBalls = 0;
  int currentWides = 0;
  int currentByes = 0;
  int currentLegByes = 0;
  int currentPenalty = 0;
  int currentBonus = 0;
  Player currentBowler;
  Player currentBatter1;
  Player currentBatter2;
  Player currentOnStrikeBatter;

  addRuns(int runs) {
    this.currentRuns += runs;
  }

  addWicket() {
    this.currentWickets += 1;
  }

  addBall() {
    this.currentBalls += 1;
  }

  String overs() {
    if (currentBalls < 1) {
      return "0.0";
    }
    int over = currentBalls ~/ 6;
    int ball = currentBalls % 6;
    return '$over.$ball';
  }
}
