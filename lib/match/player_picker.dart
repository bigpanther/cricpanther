import 'dart:collection';

import 'package:cricpanther/match/player.dart';

class PlayerPicker {
  List<Player> players;
  var alreadyPicked = HashMap<int, bool>();
  var lastIndex = 0;
  PlayerPicker(this.players);
  Player next() {
    return players[lastIndex++];
  }
}
