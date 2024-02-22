class Over {
  static String overs(int balls) {
    if (balls < 1) {
      return '0.0';
    }
    int over = balls ~/ 6;
    int ball = balls % 6;
    return '$over.$ball';
  }

  static bool finished(int balls) => balls % 6 == 0;
}
