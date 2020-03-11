import 'dart:collection';
import 'dart:math';

import 'package:cricket_scorer/match/player.dart';

class PlayerPicker {
  List<Player> players;
  final _random = new Random();
  var alreadyPicked = new HashMap<int, bool>();
  PlayerPicker(this.players);
  Player next() {
    int index = _random.nextInt(10);
    while (alreadyPicked.containsKey(index)) {
      index = _random.nextInt(10);
    }
    alreadyPicked[index] = true;
    return players[index];
  }
}
