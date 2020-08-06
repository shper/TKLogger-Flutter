import UIKit
import Flutter
import TKLogger
import tk_logger

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    
    override func application(_ application: UIApplication,
                              didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        GeneratedPluginRegistrant.register(with: self)
        
        initTKLoggerFlutter()
        
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
    
    func initTKLoggerFlutter() {
        let consoleDestination = TKLogConsoleDestination()
        consoleDestination.format = "$Dyyyy-MM-dd HH:mm:ss $C $L/$T $t $c.$f:$l - $M $I"
        TKLoggerFlutter.addDestination(consoleDestination)
    }
    
}
