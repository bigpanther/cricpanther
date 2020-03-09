import 'player.dart';

class Team {
  String name;
  Team(this.name) : assert(name.trim().length != 0) {
    players = List(12);
    for (var i = 0; i < players.length; i++) {
      var manIndex = i + 1;
      players[i] = Player('Player $manIndex');
    }
  }
  bool isBatting = false;
  List<Player> players;
  bool isBowling() {
    return !isBatting;
  }
}
