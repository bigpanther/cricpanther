import 'package:cricket_scorer/match/overs.dart';

import 'enums/handedness.dart';
import 'package:uuid/uuid.dart';

class Player {
  String id;
  String name;
  Player(this.name) {
    this.id = Uuid().v4();
  }
  var batting = Handedness.right;
  var bowling = Handedness.right;
  var isEditing = false;
  var runsScored = 0;
  var ballsFaced = 0;
  var ballsBowled = 0;
  var runsConceded = 0;
  var maidensBowled = 0;
  var wicketsTaken = 0;
  String get oversBowled => Over.overs(ballsBowled);
}
