extension RegExpExtension on String {
  String matchRegExp(String regFormat) {
    var regExp = RegExp(regFormat);

    var match = regExp.firstMatch(this);
    if (match == null) {
      return '';
    }
    return match.group(1)!;
  }
}
