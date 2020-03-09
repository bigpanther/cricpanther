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
}
