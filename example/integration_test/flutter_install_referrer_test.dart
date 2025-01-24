import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_install_referrer/flutter_install_referrer.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('FlutterInstallReferrer Plugin Tests', () {
    testWidgets('Should retrieve app information correctly',
        (WidgetTester tester) async {
      // Act
      final app = await InstallReferrer.app;

      // Assert
      expect(app.packageName?.isNotEmpty, true,
          reason: 'Package name should not be empty');
      expect(app.referrer, isNotNull, reason: 'Referrer should not be null');
    });

    testWidgets('Should detect referrer correctly',
        (WidgetTester tester) async {
      // Act
      final referrer = await InstallReferrer.referrer;

      // Assert
      expect(referrer, isNotNull, reason: 'Referrer should not be null');
      expect(
        referrer,
        anyOf([
          InstallationAppReferrer.androidDebug,
          InstallationAppReferrer.iosDebug
        ]),
        reason: 'Referrer should match a known platform',
      );
    });
  });
}
