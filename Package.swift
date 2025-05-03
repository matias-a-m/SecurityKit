// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "SecurityKit",
    platforms: [
        .iOS(.v15),
        .macOS(.v10_15)
    ],
    products: [
        .library(name: "SecurityKit", targets: ["SecurityKit"]),
    ],
    targets: [
        .target(
            name: "SecurityKit",
            path: "Sources/SecurityKit"
        ),
        .testTarget(
            name: "SecurityKitTests",
            dependencies: ["SecurityKit"],
            path: "Tests/SecurityKitTests"
        )
    ]
)
