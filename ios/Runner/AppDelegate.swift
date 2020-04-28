import UIKit
import Flutter
import GoogleMaps // Add this line!
@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    GMSServices.provideAPIKey("AIzaSyBSma58LykUdwjggxDwJKfnOJ2PtX7PX0I")  // Add this line!
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
