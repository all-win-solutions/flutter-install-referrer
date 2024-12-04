import Flutter
import UIKit

private var isDebug: Bool {
  #if DEBUG
    return true
  #else
    return false
  #endif
}

private let isFromTestFlight = Bundle.main.appStoreReceiptURL?.lastPathComponent == "sandboxReceipt"


final class SwiftInstallReferrerPlugin: NSObject, FlutterPlugin, InstallReferrerInternalAPI {
    
    static func register(with registrar: FlutterPluginRegistrar) {
        let messenger: FlutterBinaryMessenger = registrar.messenger()
        let api: InstallReferrerInternalAPI & NSObjectProtocol = SwiftInstallReferrerPlugin()
        InstallReferrerInternalAPISetup.setUp(binaryMessenger: messenger, api: api);
    }
    
    func detectReferrer(completion: @escaping (Result<IRInstallationReferrer, Error>) -> Void) {
      var installationReferrer = IRInstallationReferrer(
          type: .appStore,
          installationPlatform: .appleAppStore,
          platform: .ios,
          packageName: Bundle.main.infoDictionary?["CFBundleIdentifier"] as? String
      )

      if isDebug {
        installationReferrer.type = .debug
        installationReferrer.installationPlatform = .manually
      } else if isFromTestFlight {
        installationReferrer.type = .test
        installationReferrer.installationPlatform = .appleTestflight
      }

      completion(.success(installationReferrer))
    }
}
