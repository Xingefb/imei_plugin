#import "ImeiPlugin.h"
#import <AdSupport/AdSupport.h>


@implementation ImeiPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"imei_plugin"
            binaryMessenger:[registrar messenger]];
  ImeiPlugin* instance = [[ImeiPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  if ([@"getImei" isEqualToString:call.method]) {
    NSString *idfa = [[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString];
    result(idfa);
  } else {
    result(FlutterMethodNotImplemented);
  }
}

@end
