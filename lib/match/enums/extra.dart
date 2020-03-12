enum Extra {
  none,
  wide,
  noBall,
  bye,
  legBye,
  penalty,
  bonus,
}

class Extras {
  static List<Extra> all = [
    Extra.wide,
    Extra.noBall,
    Extra.bye,
    Extra.legBye,
    Extra.penalty,
    Extra.bonus
  ];

  static List<Extra> _eligibleExtras(Extra e) {
    switch (e) {
      case Extra.none:
        return Extras.all;
        break;
      case Extra.wide:
        return [];
        break;
      case Extra.noBall:
        return [Extra.bye, Extra.legBye];
        break;
      case Extra.bye:
        return [Extra.noBall];
        break;
      case Extra.legBye:
        return [Extra.noBall];
        break;
      case Extra.penalty:
        return [];
        break;
      case Extra.bonus:
        return [];
        break;
    }
    return [];
  }

  static bool allowedWith(Extra extra, List<Extra> e) {
    if (e.length > 1) {
      return false;
    }

    var extraAlreadyPresent = e[0];
    if (_eligibleExtras(extraAlreadyPresent).contains(extra)) {
      return true;
    }
    return false;
  }

  static bool isLegitBall(List<Extra> e) {
    if (e.length < 1 || e[0] == Extra.none) return true;
    return !e.contains(Extra.wide) &&
        !e.contains(Extra.noBall) &&
        !e.contains(Extra.penalty) &&
        !e.contains(Extra.bonus);
  }

  static String shortCode(Extra e) {
    switch (e) {
      case Extra.none:
        return '';
        break;
      case Extra.wide:
        return 'wd';
        break;
      case Extra.noBall:
        return 'nb';
        break;
      case Extra.bye:
        return 'b';
        break;
      case Extra.legBye:
        return 'lb';
        break;
      case Extra.penalty:
        return 'P';
        break;
      case Extra.bonus:
        return 'B';
        break;
    }
    return '';
  }
}
