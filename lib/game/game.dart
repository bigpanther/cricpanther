import 'team.dart';
import 'player.dart';
import 'enums/extra.dart';
import 'enums/out.dart';

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
    this.battingTeam.isBatting = true;
    this.bowlingTeam.isBatting = false;
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
