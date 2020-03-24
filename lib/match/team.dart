import 'dart:collection';

import 'player.dart';

class Team {
  String name;
  Player captain;
  Player viceCaptain;
  Player wicketKeeper;
  Player substitute;
  var isBatting = false;
  List<Player> players;
  HashMap<String, Player> playerMap;
  bool get isBowling => !isBatting;

  Team(this.name) : assert(name.trim().length != 0) {
    players = List(12);
    for (var i = 0; i < players.length; i++) {
      var manIndex = i + 1;
      players[i] = Player('$name $manIndex');
    }
    captain = players[0];
    viceCaptain = players[1];
    wicketKeeper = players[2];
    wicketKeeper.isWicketKeeper = true;
    substitute = players[11];
    substitute.isSubstitute = true;
  }
  swapWicketKeeper(Player p) {
    wicketKeeper.isWicketKeeper = false;
    wicketKeeper = p;
    wicketKeeper.isWicketKeeper = true;
  }
}
