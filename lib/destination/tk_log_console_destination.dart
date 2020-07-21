import 'package:tk_logger/destination/tk_log_base_destination.dart';
import 'package:tk_logger/model/tk_log_model.dart';
import 'package:tk_logger/tk_log_level.dart';

/// Author : Shper
/// EMail : me@shper.cn
/// Date : 2020.06.23
class TKLogConsoleDestination extends TKLogBaseDestination {
  @override
  String handlerLog(TKLogModel tkLog) {
    String logStr = super.handlerLog(tkLog);

    print(logStr);

    return "";
  }
}
