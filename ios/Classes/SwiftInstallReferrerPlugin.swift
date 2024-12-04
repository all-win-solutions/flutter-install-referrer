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


class SwiftInstallReferrerPlugin: NSObject, FlutterPlugin, InstallReferrerInternalAPI {
    
    static func register(with registrar: FlutterPluginRegistrar) {
        let messenger : FlutterBinaryMessenger = registrar.messenger()
        let api : InstallReferrerInternalAPI & NSObjectProtocol = SwiftInstallReferrerPlugin.init()
        InstallReferrerInternalAPISetup.setUp(binaryMessenger: messenger, api: api);
    }
    
    func detectReferrer(completion: @escaping (Result<IRInstallationReferer, Error>) -> Void) {
        var result = IRInstallationReferer.init()
        result.platform = IRPlatform.ios
        result.packageName = Bundle.main.infoDictionary?["CFBundleIdentifier"] as? String
        
        if (isDebug) {
            result.type = IRInstallationType.debug
            result.installationPlatform = IRInstallationPlatform.manually
        } else if (isFromTestFlight) {
            result.type = IRInstallationType.test
            result.installationPlatform = IRInstallationPlatform.appleTestflight
        } else {
            result.type = IRInstallationType.appStore
            result.installationPlatform = IRInstallationPlatform.appleAppStore
        }
        
        completion(.success(result))
    }
}
