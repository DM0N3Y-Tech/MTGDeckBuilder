// swift-tools-version:5.7
import PackageDescription

let package = Package(
    name: "MTGDeckBuilder",
    platforms: [.iOS(.15)],
    products: [
        .library(
            name: "MTGDeckBuilder",
            targets: ["MTGDeckBuilder"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/JacobHearst/ScryfallKit.git", from: "5.15.0"),
    ],
    targets: [
        .target(
            name: "MTGDeckBuilder",
            dependencies: ["ScryfallKit"]
        ),
        .testTarget(
            name: "MTGDeckBuilderTests",
            dependencies: ["MTGDeckBuilder"]
        ),
    ]
)
