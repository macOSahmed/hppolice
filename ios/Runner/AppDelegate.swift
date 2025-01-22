import UIKit
import SwiftUI
import Flutter

@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    if #available(iOS 13.0, *) {
      let contentView = ContentView()
      let window = UIWindow(frame: UIScreen.main.bounds)
      
      // Create the Flutter view controller
      let flutterViewController = FlutterViewController()
      window.rootViewController = flutterViewController
      
      // Initialize the window
      self.window = window
      window.makeKeyAndVisible()
    } else {
      // Fallback to default behavior for earlier iOS versions
      return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
    return true
  }
}
