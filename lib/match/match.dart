import 'package:cricket_scorer/utils/uuid.dart';
import 'package:flutter/material.dart';

import 'team.dart';
import 'player.dart';
import 'enums/extra.dart';
import 'enums/out.dart';

class Match with ChangeNotifier {
  static const defaultHomeTeamName = "Home Team";
  static const defaultAwayTeamName = "Away Team";
  String id = UUID.uuid();
  String playground;
  int totalOvers = 0;
  final Team homeTeam = Team(defaultHomeTeamName);
  final Team awayTeam = Team(defaultAwayTeamName);
  Team tossTeam;
  Team battingTeam;
  int target = 0;
  List<EventProcessor> matchEventsLog;

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
  MatchEvent event;
  EventProcessor(this.type, this.event);
  void record(Match match) {
    if (type == EventProcessorType.add) {
      event.process(match);
    } else {
      event.undo(match);
    }
  }
}

abstract class MatchEvent {
  DateTime eventTime;
  MatchEvent() {
    eventTime = DateTime.now();
  }
  void process(Match match);
  void undo(Match match);
}

class BallEvent extends MatchEvent {
  BallEvent() : super();
  int runs;
  Out out;
  Extra extra;
  Player batter;
  Player bowler;
  Player outPlayer;
  @override
  void process(Match match) {
    // TODO: implement process
  }

  @override
  void undo(Match match) {
    // TODO: implement undo
  }
}
