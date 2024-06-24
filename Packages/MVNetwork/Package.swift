// swift-tools-version: 5.10
import PackageDescription

let package = Package(
    name: "MVNetwork",
    platforms: [.iOS(.v17)],
    products: [
        .library(
            name: "MVNetwork",
            targets: ["MVNetwork"]),
    ],
    targets: [
        .target(
            name: "MVNetwork")
    ]
)
