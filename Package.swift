// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "K1ngLayout",
    platforms: [.iOS(.v13)],
    products: [
        .library(
            name: "K1ngLayout",
            targets: ["K1ngLayout"]
        ),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "K1ngLayout",
            dependencies: []
        ),
        .testTarget(
            name: "K1ngLayoutTests",
            dependencies: ["K1ngLayout"]
        ),
    ]
)
