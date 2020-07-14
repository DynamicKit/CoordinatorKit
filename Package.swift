// swift-tools-version:5.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CoordinatorKit",
    platforms: [
        .macOS(.v10_12),
        .iOS(.v8),
        .tvOS(.v10),
        .watchOS(.v3)
    ],
    products: [
        .library(
            name: "CoordinatorKit",
            targets: ["CoordinatorKit"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "CoordinatorKit",
            path: "Source"
        ),
        .testTarget(
            name: "CoordinatorKitTests",
            dependencies: ["CoordinatorKit"],
            path: "Tests"
        )
    ],
    swiftLanguageVersions: [
        .v5
    ]
)
