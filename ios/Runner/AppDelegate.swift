import UIKit
import Flutter
import Foundation
import GoogleMaps

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    GMSServices.provideAPIKey(ProcessInfo.processInfo.environment["ORG_GRADLE_PROJECT_MAPS_API_KEY"] ?? "")
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
