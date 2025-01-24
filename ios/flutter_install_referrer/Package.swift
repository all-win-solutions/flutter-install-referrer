// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.
import PackageDescription

let package = Package(
  name: "flutter_install_referrer",
  platforms: [
    .iOS("12.0")
  ],
  products: [
    .library(name: "flutter-install-referrer", targets: ["flutter_install_referrer"])
  ],
  dependencies: [],
  targets: [
    .target(
      name: "flutter_install_referrer",
      dependencies: [],
      resources: []
    )
  ]
)
