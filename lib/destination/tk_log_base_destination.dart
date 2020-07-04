import 'package:tk_logger/tk_log_level.dart';
import 'package:tk_logger/tk_logger.dart';

/// Author : Shper
/// EMail : me@shper.cn
/// Date : 2020.06.16
abstract class TKLogBaseDestination {
  String format = "%D %C %L/%T %c.%f:%l - %M %I";

  /// set custom log level words for each level
  LevelString levelString = LevelString();

  /// set custom log level colors for each level
  LevelColor levelColor = LevelColor();

  String handlerLog(TKLogLevel level, String message, String internalMessage,
      String clazzName, String fileName, String functionName, String line) {
    return formatLog(level, message, internalMessage, clazzName, fileName,
        functionName, line);
  }

  String formatLog(TKLogLevel level, String message, String internalMessage,
      String clazzName, String fileName, String functionName, String line) {
    String text = "";
    List<String> phrases = "%i${this.format}".split("%");

    phrases?.forEach((phrase) {
      if (phrase.isEmpty) {
        return;
      }

      String phrasePrefix = phrase[0];
      String remainingPhrase = phrase.substring(1, phrase.length);

      switch (phrasePrefix) {
        case "i": // ignore
          text += remainingPhrase;
          break;
        case "D": // Date
          text += formatDate() + remainingPhrase;
          break;
        case "C": // LevelColor
          text +=
              paddedString(colorForLevel(level), remainingPhrase.toString());
          break;
        case "L": // Level
          text += paddedString(levelWord(level), remainingPhrase.toString());
          break;
        case "T": // Tag
          text += paddedString(loggerTag(), remainingPhrase.toString());
          break;
        case "c": // clazzName
          text += paddedString(clazzName, remainingPhrase.toString());
          break;
        case "F": // fileName
          text += paddedString(fileName, remainingPhrase.toString());
          break;
        case "f": // functionName
          text += paddedString(functionName, remainingPhrase.toString());
          break;
        case "l": // line
          text += paddedString(line.toString(), remainingPhrase.toString());
          break;
        case "M": // Message
          text += paddedString(message ?? "", remainingPhrase.toString());
          break;
        case "I": // internal
          text +=
              paddedString(internalMessage ?? "", remainingPhrase.toString());
          break;
        default:
          text += remainingPhrase;
      }
    });

    return text;
  }

  String paddedString(String str1, String str2) {
    String str = str1 + str2;
    if (str == " ") {
      str = "";
    }

    return str;
  }

  String formatDate() {
    return DateTime.now().toString();
  }

  /// returns color string for level
  String colorForLevel(TKLogLevel level) {
    switch (level) {
      case TKLogLevel.DEBUG:
        return levelColor.debug;
      case TKLogLevel.INFO:
        return levelColor.info;
      case TKLogLevel.WARN:
        return levelColor.warning;
      case TKLogLevel.ERROR:
        return levelColor.error;
      default:
        return levelColor.verbose;
    }
  }

  /// returns the string of a level
  String levelWord(TKLogLevel level) {
    switch (level) {
      case TKLogLevel.DEBUG:
        return levelString.debug;
      case TKLogLevel.INFO:
        return levelString.info;
      case TKLogLevel.WARN:
        return levelString.warning;
      case TKLogLevel.ERROR:
        return levelString.error;
      default:
        return levelString.verbose;
    }
  }

  String loggerTag() {
    return TKLogger.loggerTag;
  }
}