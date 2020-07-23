import 'package:tk_logger/tk_log_level.dart';
export 'package:tk_logger/tk_log_level.dart';

/// Author : Shper
/// EMail : me@shper.cn
/// Date : 2020.06.23
class TKLogModel {
  TKLogLevel level;
  bool isIgnore = false;
  String message;
  String internalMessage;
  String clazzName;
  String fileName;
  String functionName;
  int lineNum;

  TKLogModel();

  TKLogModel.fromJson(Map<String, dynamic> data) {
    level = data["level"] ?? TKLogLevel.VERBOSE;
    isIgnore = data["isIgnore"] ?? false;
    message = data["message"] ?? "";
    internalMessage = data["internalMessage"] ?? "";
    clazzName = data["clazzName"] ?? "";
    fileName = data["fileName"] ?? "";
    functionName = data["functionName"] ?? "";
    lineNum = data["lineNum"] ?? -1;
  }
}
