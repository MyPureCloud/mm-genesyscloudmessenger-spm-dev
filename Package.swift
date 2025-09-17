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
            .exact("1.17.0")
        ),
        .package(
            name: "GenesysCloudMessengerTransport",
            url: "https://github.com/MyPureCloud/mm-genesyscloudmessengertransport-spm-dev.git",
            .exact("2.9.3-rc3")
        )
    ],
    targets: [
        .binaryTarget(
            name: "GenesysCloudMessenger",
            url: "https://genesysdx.jfrog.io/artifactory/genesys-cloud-ios.dev/GenesysCloudMessenger/GenesysCloudMessenger_version_1.17.0.rc2_commit_d336e6f5402149bdec829339fdc9621f4b3db8cf.zip",
            checksum: "65c078aaca7653d9fff96e379d555091dc6a7e5c6d2a3b4bcf5183070a0c8f0b"
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
