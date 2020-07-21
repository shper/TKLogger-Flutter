import 'package:tk_logger/filter/tk_log_base_filter.dart';
import 'package:tk_logger/model/tk_log_model.dart';

class VerboseLogFilter extends TKLogBaseFilter {
  @override
  TKLogModel handlerLog(TKLogModel log) {
    if (log.functionName == "_printVerboseLog") {
      log.isIgnore = true;
    }

    return log;
  }

}
