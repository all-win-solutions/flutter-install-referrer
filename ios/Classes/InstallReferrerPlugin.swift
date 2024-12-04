import Flutter
import UIKit

public class InstallReferrerPlugin: NSObject, FlutterPlugin {
    public static func register(with registrar: FlutterPluginRegistrar) {
        SwiftInstallReferrerPlugin.register(with: registrar)
    }
}