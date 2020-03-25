import 'package:cricket_scorer/match/batting_stats.dart';
import 'package:cricket_scorer/match/bowling_stats.dart';
import 'package:cricket_scorer/match/enums/out.dart';
import 'package:cricket_scorer/utils/uuid.dart';

import 'enums/handedness.dart';

class Player {
  BattingStats battingStats;
  BowlingStats bowlingStats;
  String id;
  String name;
  String exid;
  var isSubstitute = false;
  var isWicketKeeper = false;
  var batting = Handedness.right;
  var bowling = Handedness.right;

  var out = Out.none;
  //var fellOn = '';

  bool get isOut => out != Out.none;
  Player(this.name) : assert(name.trim().length != 0) {
    this.id = UUID.uuid();
    battingStats = BattingStats();
    bowlingStats = BowlingStats();
  }
  @override
  String toString() {
    return name;
  }
}
