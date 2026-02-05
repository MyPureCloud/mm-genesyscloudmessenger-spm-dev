// swift-tools-version: 5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "GenesysCloudMessenger",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "GenesysCloudMessenger",
            targets: ["GenesysCloudMessengerWrapper"]),
    ],
    dependencies: [
        .package(
            name: "GenesysCloudCore",
            url: "https://github.com/MyPureCloud/mobile-messenger-genesyscloudcore-spm-dev.git",
            .exact("2.1.0")
        ),
        .package(
            name: "GenesysCloudMessengerTransport",
            url: "https://github.com/MyPureCloud/mm-genesyscloudmessengertransport-spm-dev.git",
            .exact("2.12.0-rc2")
        )
    ],
    targets: [
        .binaryTarget(
            name: "GenesysCloudMessenger",
            url: "https://genesysdx.jfrog.io/artifactory/genesys-cloud-ios.dev/GenesysCloudMessenger/GenesysCloudMessenger_version_2.1.0-SNAPSHOT-feature-GMMS-6981-Configurable-Guest-Session-12_commit_3bb27d3307e41708c244b0b4d5c88aa12b8a1dbf.zip",
            checksum: "94f09c902dfdd5960e39bc33370ed574cd6bbd9751af4d38c99058b7eeee5fc3"
        ),
        .target(
            name: "GenesysCloudMessengerWrapper",
            dependencies: [
                "GenesysCloudMessenger",
                .product(name: "GenesysCloudMessengerTransport", package: "GenesysCloudMessengerTransport"),
                .product(name: "GenesysCloudCore", package: "GenesysCloudCore")
            ]
        ),
        .testTarget(name: "PackageTests", dependencies: [
            "GenesysCloudMessenger"
        ])
    ]
)
