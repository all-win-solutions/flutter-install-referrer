// Autogenerated from Pigeon (v22.6.2), do not edit directly.
// See also: https://pub.dev/packages/pigeon

import Foundation

#if os(iOS)
  import Flutter
#elseif os(macOS)
  import FlutterMacOS
#else
  #error("Unsupported platform.")
#endif

/// Error class for passing custom error details to Dart side.
final class PigeonError: Error {
  let code: String
  let message: String?
  let details: Any?

  init(code: String, message: String?, details: Any?) {
    self.code = code
    self.message = message
    self.details = details
  }

  var localizedDescription: String {
    return
      "PigeonError(code: \(code), message: \(message ?? "<nil>"), details: \(details ?? "<nil>")"
  }
}

private func wrapResult(_ result: Any?) -> [Any?] {
  return [result]
}

private func wrapError(_ error: Any) -> [Any?] {
  if let pigeonError = error as? PigeonError {
    return [
      pigeonError.code,
      pigeonError.message,
      pigeonError.details,
    ]
  }
  if let flutterError = error as? FlutterError {
    return [
      flutterError.code,
      flutterError.message,
      flutterError.details,
    ]
  }
  return [
    "\(error)",
    "\(type(of: error))",
    "Stacktrace: \(Thread.callStackSymbols)",
  ]
}

private func isNullish(_ value: Any?) -> Bool {
  return value is NSNull || value == nil
}

private func nilOrValue<T>(_ value: Any?) -> T? {
  if value is NSNull { return nil }
  return value as! T?
}

enum IRInstallationType: Int {
  case appStore = 0
  case test = 1
  case debug = 2
  case unknown = 3
}

enum IRInstallationPlatform: Int {
  case appleAppStore = 0
  case appleTestflight = 1
  case googlePlay = 2
  case amazonAppStore = 3
  case huaweiAppGallery = 4
  case oppoAppMarket = 5
  case samsungAppShop = 6
  case vivoAppStore = 7
  case xiaomiAppStore = 8
  case manually = 9
  case unknown = 10
}

enum IRPlatform: Int {
  case ios = 0
  case android = 1
}

/// Generated class from Pigeon that represents data sent in messages.
struct IRInstallationReferrer {
  var type: IRInstallationType? = nil
  var installationPlatform: IRInstallationPlatform? = nil
  var platform: IRPlatform? = nil
  var packageName: String? = nil

  // swift-format-ignore: AlwaysUseLowerCamelCase
  static func fromList(_ pigeonVar_list: [Any?]) -> IRInstallationReferrer? {
    let type: IRInstallationType? = nilOrValue(pigeonVar_list[0])
    let installationPlatform: IRInstallationPlatform? = nilOrValue(pigeonVar_list[1])
    let platform: IRPlatform? = nilOrValue(pigeonVar_list[2])
    let packageName: String? = nilOrValue(pigeonVar_list[3])

    return IRInstallationReferrer(
      type: type,
      installationPlatform: installationPlatform,
      platform: platform,
      packageName: packageName
    )
  }
  func toList() -> [Any?] {
    return [
      type,
      installationPlatform,
      platform,
      packageName,
    ]
  }
}

private class SwiftInstallReferrerPigeonPigeonCodecReader: FlutterStandardReader {
  override func readValue(ofType type: UInt8) -> Any? {
    switch type {
    case 129:
      let enumResultAsInt: Int? = nilOrValue(self.readValue() as! Int?)
      if let enumResultAsInt = enumResultAsInt {
        return IRInstallationType(rawValue: enumResultAsInt)
      }
      return nil
    case 130:
      let enumResultAsInt: Int? = nilOrValue(self.readValue() as! Int?)
      if let enumResultAsInt = enumResultAsInt {
        return IRInstallationPlatform(rawValue: enumResultAsInt)
      }
      return nil
    case 131:
      let enumResultAsInt: Int? = nilOrValue(self.readValue() as! Int?)
      if let enumResultAsInt = enumResultAsInt {
        return IRPlatform(rawValue: enumResultAsInt)
      }
      return nil
    case 132:
      return IRInstallationReferrer.fromList(self.readValue() as! [Any?])
    default:
      return super.readValue(ofType: type)
    }
  }
}

private class SwiftInstallReferrerPigeonPigeonCodecWriter: FlutterStandardWriter {
  override func writeValue(_ value: Any) {
    if let value = value as? IRInstallationType {
      super.writeByte(129)
      super.writeValue(value.rawValue)
    } else if let value = value as? IRInstallationPlatform {
      super.writeByte(130)
      super.writeValue(value.rawValue)
    } else if let value = value as? IRPlatform {
      super.writeByte(131)
      super.writeValue(value.rawValue)
    } else if let value = value as? IRInstallationReferrer {
      super.writeByte(132)
      super.writeValue(value.toList())
    } else {
      super.writeValue(value)
    }
  }
}

private class SwiftInstallReferrerPigeonPigeonCodecReaderWriter: FlutterStandardReaderWriter {
  override func reader(with data: Data) -> FlutterStandardReader {
    return SwiftInstallReferrerPigeonPigeonCodecReader(data: data)
  }

  override func writer(with data: NSMutableData) -> FlutterStandardWriter {
    return SwiftInstallReferrerPigeonPigeonCodecWriter(data: data)
  }
}

class SwiftInstallReferrerPigeonPigeonCodec: FlutterStandardMessageCodec, @unchecked Sendable {
  static let shared = SwiftInstallReferrerPigeonPigeonCodec(
    readerWriter: SwiftInstallReferrerPigeonPigeonCodecReaderWriter())
}

/// Generated protocol from Pigeon that represents a handler of messages from Flutter.
protocol InstallReferrerInternalAPI {
  func detectReferrer(completion: @escaping (Result<IRInstallationReferrer, Error>) -> Void)
}

/// Generated setup class from Pigeon to handle messages through the `binaryMessenger`.
class InstallReferrerInternalAPISetup {
  static var codec: FlutterStandardMessageCodec { SwiftInstallReferrerPigeonPigeonCodec.shared }
  /// Sets up an instance of `InstallReferrerInternalAPI` to handle messages through the `binaryMessenger`.
  static func setUp(
    binaryMessenger: FlutterBinaryMessenger, api: InstallReferrerInternalAPI?,
    messageChannelSuffix: String = ""
  ) {
    let channelSuffix = messageChannelSuffix.count > 0 ? ".\(messageChannelSuffix)" : ""
    let detectReferrerChannel = FlutterBasicMessageChannel(
      name:
        "dev.flutter.pigeon.flutter_install_referrer.InstallReferrerInternalAPI.detectReferrer\(channelSuffix)",
      binaryMessenger: binaryMessenger, codec: codec)
    if let api = api {
      detectReferrerChannel.setMessageHandler { _, reply in
        api.detectReferrer { result in
          switch result {
          case .success(let res):
            reply(wrapResult(res))
          case .failure(let error):
            reply(wrapError(error))
          }
        }
      }
    } else {
      detectReferrerChannel.setMessageHandler(nil)
    }
  }
}
