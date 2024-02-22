import 'player.dart';

class Team {
  String name;
  late Player captain;
  late Player viceCaptain;
  late Player wicketKeeper;
  late Player substitute;
  var isBatting = false;
  List<Player> players = List.filled(
    12,
    Player('name'),
    growable: false,
  );
  //late HashMap<String, Player> playerMap;
  bool get isBowling => !isBatting;

  Team(this.name) : assert(name.trim().isNotEmpty) {
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
