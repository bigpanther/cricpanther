import 'package:cricpanther/match/overs.dart';

class BattingStats {
  int runs = 0;
  int balls = 0;
  int fours = 0;
  int sixes = 0;
  int fellOnScore = 0;
  int fellOnBall = 0;

  String get fellAtOver => Over.overs(fellOnBall);
}
