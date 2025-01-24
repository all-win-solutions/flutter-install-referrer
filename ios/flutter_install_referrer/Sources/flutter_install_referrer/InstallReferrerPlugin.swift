import Flutter
import UIKit

public final class InstallReferrerPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    SwiftInstallReferrerPlugin.register(with: registrar)
  }
}
