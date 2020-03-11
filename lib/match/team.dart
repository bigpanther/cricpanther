import 'player.dart';

class Team {
  String name;
  Player captain;
  Player viceCaptain;
  Player wicketKeeper;

  Team(this.name) : assert(name.trim().length != 0) {
    players = List(12);
    for (var i = 0; i < players.length; i++) {
      var manIndex = i + 1;
      players[i] = Player('Player $manIndex');
    }
    captain = players[0];
    viceCaptain = players[1];
    wicketKeeper = players[2];
  }

  var isBatting = false;
  List<Player> players;
  bool get isBowling => !isBatting;
}
