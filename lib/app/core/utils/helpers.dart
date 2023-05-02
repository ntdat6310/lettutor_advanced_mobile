class Helper {
  static int roundHalfUp(double number) {
    int wholeNumber = number.toInt();
    double fraction = number - wholeNumber;
    if (fraction >= 0.5) {
      return wholeNumber + 1;
    } else {
      return wholeNumber;
    }
  }
}
