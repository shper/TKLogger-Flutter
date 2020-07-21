import 'dart:collection';
import 'package:tk_logger/destination/tk_log_base_destination.dart';
import 'package:tk_logger/model/tk_log_model.dart';
import 'package:tk_logger/tk_log_level.dart';
import 'package:tk_logger/util/tk_log_utils.dart';

/// Author : Shper
/// EMail : me@shper.cn
/// Date : 2020.06.16
class TKLogger {
  static var loggerTag = "TKLogger";
  static var minLevel = TKLogLevel.VERBOSE;

  static var _destinations = HashSet<TKLogBaseDestination>();

  static void setup({tag = "TKLogger", level = TKLogLevel.VERBOSE}) {
    loggerTag = tag;
    minLevel = level;
  }

  /// Destination
  static bool addDestination(TKLogBaseDestination destination) {
    if (_destinations.contains(destination)) {
      return false;
    }

    _destinations.add(destination);
    return true;
  }

  /// Levels

  static void verbose(String message, {String interMessage}) {
    _dispatchLog(TKLogLevel.VERBOSE, message, interMessage: interMessage);
  }

  static void info(String message, {String interMessage}) {
    _dispatchLog(TKLogLevel.INFO, message, interMessage: interMessage);
  }

  static void debug(String message, {String interMessage}) {
    _dispatchLog(TKLogLevel.DEBUG, message, interMessage: interMessage);
  }

  static void warning(String message, {String interMessage}) {
    _dispatchLog(TKLogLevel.WARN, message, interMessage: interMessage);
  }

  static void error(String message, {String interMessage}) {
    _dispatchLog(TKLogLevel.ERROR, message, interMessage: interMessage);
  }

  /// Inner Function

  static void _dispatchLog(TKLogLevel level, String message,
      {String interMessage}) {
    if (level.index < minLevel.index) {
      return;
    }
    TKLogModel logModel =
        TKLogUtils.parseStackTrace(StackTrace.current.toString());

    // Use filters to process logs


    // dispatch the logs to destination
    _destinations.forEach((destination) {
      destination.handlerLog(
          level,
          message,
          interMessage ?? "",
          logModel.clazzName,
          logModel.fileName,
          logModel.functionName,
          logModel.lineNum);
    });
  }
}
