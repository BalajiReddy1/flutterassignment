class MyFunctions {
  static int parseToInt(String value, [int defaultValue = 0]) {
    return int.tryParse(value) ?? defaultValue;
  }
}
