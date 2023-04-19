import FlutterMacOS
import Cocoa

/// Swift app settings plugin with method channel call handler.
public class SwiftAppSettingsPlugin: NSObject, FlutterPlugin {
  /// Private method to open device settings window
  private func openSettings() {
    if let url = URL(string: "x-apple.systempreferences:com.apple.preference.notifications") {
      NSWorkspace.shared.open(url)
    }
  }

  /// Public register method for Flutter plugin registrar.
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "app_settings", binaryMessenger: registrar.messenger)
    let instance = SwiftAppSettingsPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  /// Public handler method for managing method channel calls.
  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    openSettings()
    result("Done")
  }
}
