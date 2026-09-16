// swift-tools-version: 5.10
import PackageDescription

let package = Package(
    name: "AMAImageProcessor",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "AMAImageProcessor",
            targets: ["AMAImageProcessorWrapper"]),
    ],
    dependencies: [
        .package(url: "https://github.com/vbmobile/AMAUtils", .upToNextMinor(from: "3.0.8")),
    ],
    targets: [
        .binaryTarget(
            name: "AMAImageProcessor",
            url: "https://vbmobileidstorage.blob.core.windows.net/ios/AMAImageProcessor/AMAImageProcessor-2.0.6.zip",
            checksum: "e9348d34f3d7e7e7587713f2445ecf34b7b27b3f4555a7ffe1bf5fdd3c9e2d15"
        ),
        .target(
            name: "AMAImageProcessorWrapper",
            dependencies: [
                .target(name: "AMAImageProcessor"),
                .product(name: "AMAUtils", package: "AMAUtils")
            ],
            path: "Sources",
            sources: ["dummy.swift"]
        )
    ],
    swiftLanguageVersions: [.v5]
)
