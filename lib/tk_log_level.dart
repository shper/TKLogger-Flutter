/// Author : Shper
/// EMail : me@shper.cn
/// Date : 2020.06.16
enum TKLogLevel {
  VERBOSE,
  DEBUG,
  INFO,
  WARN,
  ERROR,
}

extension TKLogLevelName on TKLogLevel {
  String name() {
    var fullName = this.toString();
    return fullName.substring(fullName.lastIndexOf(".") + 1, fullName.length);
  }
}

class LevelString {
  var verbose = "V";
  var debug = "D";
  var info = "I";
  var warning = "W";
  var error = "E";
}

class LevelColor {
  var verbose = "💜"; // silver
  var debug = "💚"; // green
  var info = "💙"; // blue
  var warning = "💛"; // yellow
  var error = "💔"; // red
}
