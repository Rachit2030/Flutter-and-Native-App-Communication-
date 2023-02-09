import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
      
      let controller: FlutterViewController = window?.rootViewController as! FlutterViewController
      let method_channel_name = "material.dart/battery"
      let batteryChannel = FlutterMethodChannel(
        name: method_channel_name,
        binaryMessenger:controller.binaryMessenger
        )
      batteryChannel.setMethodCallHandler({
        (call: FlutterMethodCall, result: @escaping FlutterResult)-> Void in 
        switch call.method {
        case "getBatteryLevel": result("HELLO iOS")
          
        default: result(FlutterMethodNotImplemented) 
          
        }
      })
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
