import 'package:cricpanther/match/batting_stats.dart';
import 'package:cricpanther/match/bowling_stats.dart';
import 'package:cricpanther/match/enums/out.dart';
import 'package:cricpanther/utils/uuid.dart';

import 'enums/handedness.dart';

class Player {
  BattingStats battingStats;
  BowlingStats bowlingStats;
  String id;
  String name;
  String? exid;
  var isSubstitute = false;
  var isWicketKeeper = false;
  var batting = Handedness.right;
  var bowling = Handedness.right;

  var out = Out.none;
  //var fellOn = '';

  bool get isOut => out != Out.none;
  Player(this.name)
      : id = UUID.uuid(),
        battingStats = BattingStats(),
        bowlingStats = BowlingStats(),
        assert(name.trim().isNotEmpty);
  @override
  String toString() {
    return name;
  }
}
