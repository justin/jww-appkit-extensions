// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "JWWAppKit",
    platforms: [
        .macOS(.v14)
    ],
    products: [
        .library(name: "JWWAppKit", targets: ["JWWAppKit"]),
    ],
    targets: [
        .target(name: "JWWAppKit"),
        .testTarget(name: "JWWAppKitTests", dependencies: ["JWWAppKit"]),
    ]
)
