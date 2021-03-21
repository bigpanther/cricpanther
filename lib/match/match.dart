import 'package:cricpanther/utils/uuid.dart';
import 'package:flutter/material.dart';

import 'team.dart';
import 'player.dart';
import 'enums/extra.dart';
import 'enums/out.dart';

class Match with ChangeNotifier {
  bool firstInnings = true;
  static const defaultHomeTeamName = "T1";
  static const defaultAwayTeamName = "T2";
  String id = UUID.uuid();
  String playground;
  int _totalOvers = 0;
  set totalOvers(val) => _totalOvers = val;
  int get totalBalls => _totalOvers * 6;
  set maxPlayers(val) => _maxPlayers = val;
  int get maxPlayers => _maxPlayers;
  int _maxPlayers = 11;
  bool frozen = false;
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

  void start({@required Team toss, @required Team batting}) {
    this.tossTeam = toss;
    this.battingTeam = batting;
    this.battingTeam.isBatting = true;
    this.bowlingTeam.isBatting = false;
  }

  void endFirstInnings() {
    firstInnings = false;
    var currentBatting = this.battingTeam;
    currentBatting.isBatting = false;
    this.bowlingTeam.isBatting = true;
    this.battingTeam = this.bowlingTeam;
    this.battingTeam = currentBatting;
    notifyListeners();
  }

  void end() {
    frozen = true;
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
