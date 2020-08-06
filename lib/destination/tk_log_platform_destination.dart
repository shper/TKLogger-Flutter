import 'package:flutter/services.dart';
import 'package:tk_logger/destination/tk_log_base_destination.dart';
import 'package:tk_logger/model/tk_log_model.dart';

/// Author : Shper
/// EMail : me@shper.cn
/// Date : 2020.07.22
class TKLogPlatformDestination extends TKLogBaseDestination {
  MethodChannel _methodChannel;

  TKLogPlatformDestination() {
    _methodChannel = MethodChannel("plugin.shper.cn/tk_logger");
  }

  @override
  String handlerLog(TKLogModel tkLog) {
    Map<String, dynamic> params = {
      "levelIndex": tkLog.level.index,
      "levelName": tkLog.level.name(),
      "message": tkLog.message,
      "internalMessage": tkLog.internalMessage,
      "clazzName": tkLog.clazzName,
      "fileName": tkLog.fileName,
      "functionName": tkLog.functionName,
      "threadName": "Flutter",
      "lineNum": tkLog.lineNum,
    };
    _methodChannel.invokeMethod("handlerLog", params);

    return "";
  }
}
