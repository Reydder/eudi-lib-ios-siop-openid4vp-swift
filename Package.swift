// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "presentation-exchange-ios",
    platforms: [.iOS(.v14)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "presentation-exchange-ios",
            targets: ["presentation-exchange-ios"]),
    ],
    dependencies: [
      .package(
        url: "https://github.com/kylef/JSONSchema.swift",
        from: "0.6.0"
      ),
      .package(
        url: "https://github.com/KittyMac/Sextant.git",
          .upToNextMinor(from: "0.4.0")
      )
    ],
    targets: [
        .target(
            name: "presentation-exchange-ios",
            dependencies: [
              .product(
                name: "Sextant",
                package: "Sextant"
              )
            ],
            resources: [
              .process("Resources")
            ]
        ),
        .testTarget(
            name: "presentation-exchange-iosTests",
            dependencies: [
              "presentation-exchange-ios",
              .product(
                name: "JSONSchema",
                package: "JSONSchema.swift"
              ),
              .product(
                name: "Sextant",
                package: "Sextant"
              )
            ]
        ),
    ]
)
