package cn.shper.flutter.tk_logger_example

import android.os.Bundle
import cn.shper.flutter.tk_logger.TKLoggerFlutter
import cn.shper.tklogger.destination.TKLogConsoleDestination
import io.flutter.embedding.android.FlutterActivity

class MainActivity: FlutterActivity() {

  override fun onCreate(savedInstanceState: Bundle?) {
    super.onCreate(savedInstanceState)

    TKLoggerFlutter.addDestination(TKLogConsoleDestination())
  }

}
