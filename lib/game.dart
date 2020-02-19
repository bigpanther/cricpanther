class Game {
  int runs = 0;
  int balls = 0;
  int wickets = 0;
  int target = 0;
  int totalOvers = 0;
  Team homeTeam;
  Team awayTeam;
  Team tossTeam;
  Team battingTeam;
  List<EventProcessor> gameEventsLog;
  Game(String homeTeamName, awayTeamName) {
    homeTeam = Team(homeTeamName);
    awayTeam = Team(awayTeamName);
  }
  Team get bowlingTeam {
    if (homeTeam.isBatting) return awayTeam;
    return homeTeam;
  }

  void start(Team toss, batting) {
    this.tossTeam = toss;
    this.battingTeam = batting;
  }
}

enum EventProcessorType { add, undo }

class EventProcessor {
  EventProcessorType type;
  GameEvent event;
  EventProcessor(this.type, this.event);
  void record(Game game) {
    if (type == EventProcessorType.add) {
      event.process(game);
    } else {
      event.undo(game);
    }
  }
}

class Player {
  String name;
  Player(this.name);
  Handedness batting = Handedness.right;
  Handedness bowling = Handedness.right;
  bool isEditing = false;
}

enum Handedness { right, left }

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

enum Out {
  none,
  bowled,
  caught,
  lbw,
  stumped,
  runOut,
  timeOut,
  hitWicket,
  obstruction,
  retired,
  hitTwice,
}

enum Extra {
  none,
  wide,
  noBall,
  bye,
  legBye,
  penalty,
}

abstract class GameEvent {
  DateTime eventTime;
  GameEvent() {
    eventTime = DateTime.now();
  }
  void process(Game game);
  void undo(Game game);
}

class BallEvent extends GameEvent {
  BallEvent() : super();
  int runs;
  Out out;
  Extra extra;
  Player batter;
  Player bowler;
  Player outPlayer;
  @override
  void process(Game game) {
    // TODO: implement process
  }

  @override
  void undo(Game game) {
    // TODO: implement undo
  }
}
