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
  mankad
}

extension OutExtension on Out {
  String get text {
    switch (this) {
      case Out.none:
        return '';
        break;
      case Out.bowled:
        return 'Bowled';
        break;
      case Out.caught:
        return 'Caught';
        break;
      case Out.lbw:
        return 'LBW';
        break;
      case Out.stumped:
        return 'Stumped';
        break;
      case Out.runOut:
        return "Run out";
        break;
      case Out.timeOut:
        return 'Time Out';
        break;
      case Out.hitWicket:
        return 'Hit wicket';
        break;
      case Out.obstruction:
        return 'Obstruction';
        break;
      case Out.retired:
        return 'Retired';
        break;
      case Out.hitTwice:
        return 'Hit twice';
        break;
      case Out.mankad:
        return 'Mankad';
        break;
    }
    return '';
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
      Out.mankad,
      Out.hitWicket,
      Out.timeOut,
      Out.hitTwice,
    ];
  }

  bool requiresBallToBeBowled() {
    return ![Out.mankad, Out.timeOut].contains(this);
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
