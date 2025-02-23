// swift-tools-version:5.6
import PackageDescription

let package = Package(
    name: "MTGDeckBuilder",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "MTGDeckBuilder",
            targets: ["MTGDeckBuilder"]
        ),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "MTGDeckBuilder",
            dependencies: []
        ),
        .testTarget(
            name: "MTGDeckBuilderTests",
            dependencies: ["MTGDeckBuilder"]
        ),
    ]
)
