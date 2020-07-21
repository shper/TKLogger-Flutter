import 'package:tk_logger/filter/tk_log_base_filter.dart';
import 'package:tk_logger/model/tk_log_model.dart';

class VerboseLogFilter extends TKLogBaseFilter {
  @override
  TKLogModel handlerLog(TKLogModel tkLog) {
    if (tkLog.functionName == "_printVerboseLog") {
      tkLog.isIgnore = true;
    }

    return tkLog;
  }

}
