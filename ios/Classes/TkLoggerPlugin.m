#import "TkLoggerPlugin.h"
#if __has_include(<tk_logger/tk_logger-Swift.h>)
#import <tk_logger/tk_logger-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "tk_logger-Swift.h"
#endif

@implementation TkLoggerPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftTkLoggerPlugin registerWithRegistrar:registrar];
}
@end
