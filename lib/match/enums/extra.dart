enum Extra {
  none,
  wide,
  noBall,
  bye,
  legBye,
  penalty,
  bonus,
}

extension ExtraListExtension on List<Extra> {
  bool isLegitBall() {
    if (this.length < 1 || this[0] == Extra.none) return true;
    return !this.contains(Extra.wide) &&
        !this.contains(Extra.noBall) &&
        !this.contains(Extra.penalty) &&
        !this.contains(Extra.bonus);
  }
}

extension ExtraExtension on Extra {
  static List<Extra> all = [
    Extra.wide,
    Extra.noBall,
    Extra.bye,
    Extra.legBye,
    Extra.penalty,
    Extra.bonus
  ];

  List<Extra> _eligibleExtras() {
    switch (this) {
      case Extra.none:
        return all;
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

  bool allowedWith(List<Extra> e) {
    if (e.length > 1) {
      return false;
    }

    var extraAlreadyPresent = e[0];
    if (extraAlreadyPresent._eligibleExtras().contains(this)) {
      return true;
    }
    return false;
  }

  String shortCode() {
    switch (this) {
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
