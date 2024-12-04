import 'package:pigeon/pigeon.dart';

@ConfigurePigeon(
  PigeonOptions(
    kotlinOptions: KotlinOptions(
      package: 'fr.g123k.install_referrer'
    ),
    swiftOptions: SwiftOptions(),
    dartOptions: DartOptions(
    ),
    dartOut: './lib/src/private/pigeon_api.dart',
    swiftOut: './ios/Classes/Messages.swift',
    kotlinOut: './android/src/main/kotlin/fr/g123k/install_referrer/InstallReferrerPigeon.kt'
  ),
)
class IRInstallationReferer {
  final IRInstallationType? type;
  final IRInstallationPlatform? installationPlatform;
  final IRPlatform? platform;
  final String? packageName;

  IRInstallationReferer({
    this.type,
    this.platform,
    this.installationPlatform,
    this.packageName,
  });
}

enum IRInstallationType {
  appStore,
  test,
  debug,
  unknown,
}

enum IRInstallationPlatform {
  appleAppStore,
  appleTestflight,
  googlePlay,
  amazonAppStore,
  huaweiAppGallery,
  oppoAppMarket,
  samsungAppShop,
  vivoAppStore,
  xiaomiAppStore,
  manually,
  unknown,
}

enum IRPlatform {
  ios,
  android,
}

@HostApi()
abstract class InstallReferrerInternalAPI {
  @async
  IRInstallationReferer detectReferrer();
}
