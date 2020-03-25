import 'package:cricket_scorer/match/overs.dart';

class BowlingStats {
  int runs = 0;
  int balls = 0;
  int fours = 0;
  int sixes = 0;
  int wides = 0;
  int noBalls = 0;
  int maidens = 0;
  int wickets = 0;
  String get oversBowled => Over.overs(balls);
}
