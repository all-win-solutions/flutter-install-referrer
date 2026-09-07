## 3.0.1

* Bumps `pigeon` to 28.0.0 and regenerates the platform interfaces; the Android and iOS host APIs are now coroutine/async based.
* Adds `meta` to `dependencies`, as the pigeon 28 generated code imports it.

## 3.0.0

* **BREAKING**: Updates minimum supported SDK version to Flutter 3.44 / Dart 3.12.
* **BREAKING**: Raises Android `minSdk` from 21 to 24.
* Migrates to built-in Kotlin (removes `kotlin-android` plugin, moves `jvmTarget` to top-level `kotlin { compilerOptions { } }` block).
* Migrates Android Gradle scripts to Kotlin DSL (`build.gradle.kts`, `settings.gradle.kts`).
* Bumps Android Gradle Plugin to 9.0.1 and Kotlin to 2.3.20.
* Bumps `compileSdk` to 36 and Java toolchain to 17.

## 2.1.1

* Upgrades Flutter SDK and related dependencies to latest versions

## 2.1.0

* Updates Flutter and dependencies, bumps iOS minimum to 13.0
* Upgrades Flutter SDK and related dependencies to latest versions
* Regenerates Pigeon interfaces for improved type safety and equality

## 2.0.2

* Adds caching for app referrer.

## 2.0.1

* Improved description clarity and text grammar was corrected

## 2.0.0

* Migrated from Java/Objective-C to modern Kotlin/Swift
* Added Swift Package Manager support
* Updated dependencies & Android build system

## 1.2.1

* Oppo App Market, Vivo App Store & Xiaomi App Store now supported

## 1.2.0

* Two Widgets (`InstallReferrerDetectorListener` and `InstallReferrerDetectorBuilder`) allows to get the result of `InstallReferrer.app` directly in your Widgets hierarchy

## 1.1.0

* Package name / App Id now available

## 1.0.2

* Support for Huawei App Gallery

## 1.0.1

* Improved documentation

## 1.0.0

* Initial release (Android & iOS)
