#import "SmsSignatureHelperPlugin.h"
#if __has_include(<sms_signature_helper/sms_signature_helper-Swift.h>)
#import <sms_signature_helper/sms_signature_helper-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "sms_signature_helper-Swift.h"
#endif

@implementation SmsSignatureHelperPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftSmsSignatureHelperPlugin registerWithRegistrar:registrar];
}
@end
