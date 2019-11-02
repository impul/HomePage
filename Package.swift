// swift-tools-version:4.0

import PackageDescription

let package = Package(
    name: "Hello",
    products: [
        .library(name: "App", targets: ["App"]),
        .executable(name: "Run", targets: ["Run"])
    ],
    dependencies: [
        .package(url: "https://github.com/PoissonBallon/google-analytics-provider.git", from: "0.0.2"),
        .package(url: "https://github.com/vapor/vapor.git", .upToNextMajor(from: "3.3.0")),
        .package(url: "https://github.com/vapor/fluent-provider.git", .upToNextMajor(from: "1.2.0"))
    ],
    targets: [
        .target(name: "App", dependencies: ["Vapor", "GoogleAnalyticsProvider", "FluentProvider"],
                exclude: [
                    "Config",
                    "Public",
                    "Resources",
                ]),
        .target(name: "Run", dependencies: ["App"]),
        .testTarget(name: "AppTests", dependencies: ["App", "Testing"])
    ]
)

