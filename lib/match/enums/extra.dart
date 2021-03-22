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
      case Extra.wide:
        return [];
      case Extra.noBall:
        return [Extra.bye, Extra.legBye];
      case Extra.bye:
        return [Extra.noBall];
      case Extra.legBye:
        return [Extra.noBall];
      case Extra.penalty:
        return [];
      case Extra.bonus:
        return [];
    }
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
      case Extra.wide:
        return 'wd';
      case Extra.noBall:
        return 'nb';
      case Extra.bye:
        return 'b';
      case Extra.legBye:
        return 'lb';
      case Extra.penalty:
        return 'P';
      case Extra.bonus:
        return 'B';
    }
  }
}
