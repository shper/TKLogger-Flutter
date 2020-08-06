import Flutter
import UIKit
import TKLogger

public class SwiftTkLoggerPlugin: NSObject, FlutterPlugin {
    
    static let CHANNEL_NAME = "plugin.shper.cn/tk_logger"
    static let HANDLER_LOG = "handlerLog"
    
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: CHANNEL_NAME, binaryMessenger: registrar.messenger())
        let instance = SwiftTkLoggerPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        if (call.method == SwiftTkLoggerPlugin.HANDLER_LOG) {
            handlerLog(call)
        }
        
        result("success")
    }
    
    private func handlerLog(_ call: FlutterMethodCall) {
        guard let arguments = call.arguments as? Dictionary<String, Any> else {
            return
        }
        
        let tkLog = TKLogModel()
        tkLog.level = TKLogLevel(rawValue: arguments["levelIndex"] as? Int ?? 0) ?? TKLogLevel.verbose
        tkLog.message = arguments["message"] as? String ?? ""
        tkLog.internalMessage = arguments["internalMessage"] as? String ?? ""
        tkLog.clazzName = arguments["clazzName"] as? String ?? ""
        tkLog.fileName = arguments["fileName"] as? String ?? ""
        tkLog.functionName = arguments["functionName"] as? String ?? ""
        tkLog.threadName = arguments["threadName"] as? String ?? "Flutter"
        tkLog.lineNum = arguments["lineNum"] as? Int ?? -1
        
        TKLoggerFlutter.handlerLog(tkLog)
    }
    
}
