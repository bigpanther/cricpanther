import 'dart:collection';
//import 'dart:math';

import 'package:cricket_scorer/match/player.dart';

class PlayerPicker {
  List<Player> players;
  var alreadyPicked = new HashMap<int, bool>();
  var lastIndex = 0;
  PlayerPicker(this.players);
  Player next() {
    return players[lastIndex++];
  }
}
