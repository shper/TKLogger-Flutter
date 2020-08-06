package cn.shper.flutter.tk_logger

import androidx.annotation.NonNull;
import cn.shper.tklogger.TKLogLevel
import cn.shper.tklogger.model.TKLogModel

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.PluginRegistry.Registrar

/** TkLoggerPlugin */
class TkLoggerPlugin: FlutterPlugin, MethodCallHandler {

  private lateinit var channel : MethodChannel

  companion object {

    const val METHOD_CHANNEL_NAME: String = "plugin.shper.cn/tk_logger"

    /// Flutter 1.12+
    @JvmStatic
    fun registerWith(registrar: Registrar) {
      val channel = MethodChannel(registrar.messenger(), METHOD_CHANNEL_NAME)
      channel.setMethodCallHandler(TkLoggerPlugin())
    }
  }

  /// Flutter 1.17+
  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, METHOD_CHANNEL_NAME)
    channel.setMethodCallHandler(this);
  }

  override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
    if (call.method == "handlerLog") {

     val tkLog = TKLogModel().apply {
       level = TKLogLevel.valueOf(call.argument<String>("levelName") ?: TKLogLevel.VERBOSE.name)
       message = call.argument<String>("message") ?: ""
       internalMessage = call.argument<String>("internalMessage") ?: ""
       clazzName = call.argument<String>("clazzName") ?: ""
       fileName = call.argument<String>("fileName") ?: ""
       functionName = call.argument<String>("functionName") ?: ""
       lineNum = call.argument<Int>("lineNum") ?: -1
       threadName = "Flutter"
      }
      result.success("")

      TKLoggerFlutter.handlerLog(tkLog)
    } else {
      result.notImplemented()
    }
  }

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }
}
