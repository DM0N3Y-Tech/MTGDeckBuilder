// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "MTGDeckBuilder",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .library(
            name: "MTGDeckBuilder",
            targets: ["MTGDeckBuilder"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/stevemoser/ScryfallKit.git", from: "1.0.0")
    ],
    targets: [
        .target(
            name: "MTGDeckBuilder",
            dependencies: ["ScryfallKit"]
        ),
        .testTarget(
            name: "MTGDeckBuilderTests",
            dependencies: ["MTGDeckBuilder"]
        )
    ]
)