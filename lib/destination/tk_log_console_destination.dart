import 'package:tk_logger/destination/tk_log_base_destination.dart';
import 'package:tk_logger/tk_log_level.dart';

/// Author : Shper
/// EMail : me@shper.cn
/// Date : 2020.06.23
class TKLogConsoleDestination extends TKLogBaseDestination {
  @override
  String handlerLog(TKLogLevel level, String message, String interMsg,
      String clazzName, String fileName, String functionName, String line) {
    String logStr = super.handlerLog(
        level, message, interMsg, clazzName, fileName, functionName, line);

    print(logStr);

    return logStr;
  }
}
