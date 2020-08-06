import 'dart:collection';
import 'package:tk_logger/destination/tk_log_base_destination.dart';
import 'package:tk_logger/filter/tk_log_base_filter.dart';
import 'package:tk_logger/model/tk_log_model.dart';
import 'package:tk_logger/tk_log_level.dart';
import 'package:tk_logger/util/tk_log_utils.dart';

/// Author : Shper
/// EMail : me@shper.cn
/// Date : 2020.06.16
class TKLogger {
  static var loggerTag = "TKLogger";
  static var minLevel = TKLogLevel.VERBOSE;

  static var _filters = List<TKLogBaseFilter>();
  static var _destinations = HashSet<TKLogBaseDestination>();

  static void setup({tag = "TKLogger", level = TKLogLevel.VERBOSE}) {
    loggerTag = tag;
    minLevel = level;
  }

  /// Filter
  static void addFilter(TKLogBaseFilter filter, {int priority}) {
    if (priority != null) {
      _filters.insert(priority, filter);
    } else {
      _filters.add(filter);
    }
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

  static void verbose(String message, {String internalMessage}) {
    _dispatchLog(TKLogLevel.VERBOSE, message, internalMessage: internalMessage);
  }

  static void info(String message, {String internalMessage}) {
    _dispatchLog(TKLogLevel.INFO, message, internalMessage: internalMessage);
  }

  static void debug(String message, {String internalMessage}) {
    _dispatchLog(TKLogLevel.DEBUG, message, internalMessage: internalMessage);
  }

  static void warning(String message, {String internalMessage}) {
    _dispatchLog(TKLogLevel.WARNING, message, internalMessage: internalMessage);
  }

  static void error(String message, {String internalMessage}) {
    _dispatchLog(TKLogLevel.ERROR, message, internalMessage: internalMessage);
  }

  /// Inner Function

  static void _dispatchLog(TKLogLevel level, String message,
      {String internalMessage}) {
    if (level.index < minLevel.index) {
      return;
    }
    TKLogModel tkLog =
        TKLogUtils.parseStackTrace(StackTrace.current.toString());
    tkLog.level = level;
    tkLog.message = message;
    tkLog.internalMessage = internalMessage ?? "";

    // Use filters to process logs
    _filters.forEach((filter) {
      tkLog = filter.handlerLog(tkLog);
    });

    if (tkLog.isIgnore) {
      return;
    }

    // dispatch the logs to destination
    _destinations.forEach((destination) {
      destination.handlerLog(tkLog);
    });
  }
}
