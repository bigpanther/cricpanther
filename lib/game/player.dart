import 'enums/handedness.dart';

class Player {
  String name;
  Player(this.name);
  Handedness batting = Handedness.right;
  Handedness bowling = Handedness.right;
  bool isEditing = false;
}
