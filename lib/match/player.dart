import 'package:cricket_scorer/match/enums/out.dart';
import 'package:cricket_scorer/match/overs.dart';
import 'package:cricket_scorer/utils/uuid.dart';

import 'enums/handedness.dart';

class Player {
  String id;
  String name;
  String exid;
  var isSubstitute = false;
  var isWicketKeeper = false;
  var batting = Handedness.right;
  var bowling = Handedness.right;
  var runsScored = 0;
  var ballsFaced = 0;
  var ballsBowled = 0;
  var runsConceded = 0;
  var maidensBowled = 0;
  var wicketsTaken = 0;
  var out = Out.none;
  //var fellOn = '';
  String get oversBowled => Over.overs(ballsBowled);
  bool get isOut => out != Out.none;
  Player(this.name) {
    this.id = UUID.uuid();
  }
  @override
  String toString() {
    return name;
  }
}
