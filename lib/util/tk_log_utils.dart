import 'package:tk_logger/model/tk_log_model.dart';

/// Author : Shper
/// EMail : me@shper.cn
/// Date : 2020.06.23
class TKLogUtils {
  static TKLogModel parseStackTrace(String stackTrace) {
    TKLogModel logModel = TKLogModel();

    List<String> stackList = stackTrace.split("\n");
    if (stackList == null || stackList.isEmpty) {
      return logModel;
    }

    String callerStack = "";
    for (var index = 0; index < stackList.length - 1; index++) {
      if (stackList[index].contains("package:tk_logger/") &&
          !stackList[index + 1].contains("package:tk_logger/")) {
        callerStack = stackList[index + 1];
      }
    }

    //#2   _MyAppState._printDebugLog (package:tk_logger_example/main.dart:45:14)
    List<String> subCallerStacks = callerStack.split(" (package:");
    if (subCallerStacks == null || subCallerStacks.isEmpty) {
      return logModel;
    }

    //#2   _MyAppState._printDebugLog
    List<String> firstPartList = subCallerStacks[0].split(".");
    if (firstPartList != null &&
        firstPartList.isNotEmpty &&
        firstPartList.length >= 2) {

      logModel.functionName = firstPartList.last;

      List<String> clazzNameList =
          (firstPartList[firstPartList.length - 2] ?? "").split(" ");
      logModel.clazzName = clazzNameList.last;
    }

    //tk_logger_example/main.dart:45:14)
    List<String> secondPartList = subCallerStacks[1].split("/");
    if (secondPartList != null &&
        secondPartList.isNotEmpty &&
        secondPartList.length >= 2) {

      List<String> infoList = secondPartList[1].split(":");
      logModel.fileName = infoList[0] ?? "";
      logModel.lineNum = infoList[1] ?? "";
    }

    return logModel;
  }
}
