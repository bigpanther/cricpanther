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

extension OutExtension on Out {
  String get text {
    switch (this) {
      case Out.none:
        return 'NOT OUT';
      case Out.bowled:
        return 'Bowled';
      case Out.caught:
        return 'Caught';
      case Out.lbw:
        return 'LBW';
      case Out.stumped:
        return 'Stumped';
      case Out.runOut:
        return 'Run out';
      case Out.timeOut:
        return 'Time Out';
      case Out.hitWicket:
        return 'Hit wicket';
      case Out.obstruction:
        return 'Obstruction';
      case Out.retired:
        return 'Retired';
      case Out.hitTwice:
        return 'Hit twice';
    }
  }

  //Out get value => this;
  static List<Out> all() {
    return [
      Out.bowled,
      Out.caught,
      Out.lbw,
      Out.runOut,
      Out.stumped,
      Out.retired,
      Out.obstruction,
      Out.hitWicket,
      Out.timeOut,
      Out.hitTwice,
    ];
  }

  bool requiresBallToBeBowled() {
    return ![Out.runOut, Out.timeOut].contains(this);
  }

  bool requiresFielder() {
    return [Out.caught, Out.runOut].contains(this);
  }

  bool requiresBatter() {
    return [Out.runOut, Out.obstruction, Out.retired, Out.timeOut]
        .contains(this);
  }

  bool isBowlersWicket() {
    return [Out.bowled, Out.lbw, Out.caught, Out.stumped, Out.hitWicket]
        .contains(this);
  }
}
