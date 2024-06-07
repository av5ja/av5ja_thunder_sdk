// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ThunderSDK",
    platforms: [
        .iOS(.v14), .macOS(.v12)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "Thunder",
            targets: ["Thunder"]),
        .library(
            name: "Raccoon",
            targets: ["Raccoon"]),
        .library(
            name: "Firebolt",
            targets: ["Thunder", "Firebolt", "Raccoon"]),
    ],
    dependencies: [
        .package(url: "https://github.com/realm/SwiftLint.git", from: "0.55.0"),
        .package(url: "https://github.com/Alamofire/Alamofire.git", exact: "5.7.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "Thunder",
            plugins: [
                .plugin(name: "SwiftLintBuildToolPlugin", package: "SwiftLint")
            ]),
        .target(
            name: "Raccoon",
            plugins: [
                .plugin(name: "SwiftLintBuildToolPlugin", package: "SwiftLint")
            ]),
        .target(
            name: "Firebolt",
            dependencies: [
                "Alamofire"
            ],
            plugins: [
                .plugin(name: "SwiftLintBuildToolPlugin", package: "SwiftLint")
            ]),
        .testTarget(
            name: "ThunderTests",
            dependencies: ["Thunder"]),
    ]
)
