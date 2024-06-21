// swift-tools-version: 5.10
import PackageDescription

let package = Package(
    name: "ApiServiceKit",
    platforms: [.iOS(.v17)],
    products: [
        .library(
            name: "ApiServiceKit",
            targets: ["ApiServiceKit"]),
    ],
    targets: [
        .target(
            name: "ApiServiceKit")
    ]
)
