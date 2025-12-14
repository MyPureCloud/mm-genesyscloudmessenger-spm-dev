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
            .exact("0.0.1")
        ),
        .package(
            name: "GenesysCloudMessengerTransport",
            url: "https://github.com/MyPureCloud/mm-genesyscloudmessengertransport-spm.git",
            .exact("2.10.1")
        )
    ],
    targets: [
        .binaryTarget(
            name: "GenesysCloudMessenger",
            url: "https://genesysdx.jfrog.io/artifactory/genesys-cloud-ios.dev/GenesysCloudMessenger/GenesysCloudMessenger_version_0.0.1-SNAPSHOT-PR-120-6_commit_c37b13f6aea5441400cca48ab96eb52731c9692a.zip",
            checksum: "733a2bdb0e10b3c041f724113571cff45770f8cc7c30716e26ca0dd4c063ce94"
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
