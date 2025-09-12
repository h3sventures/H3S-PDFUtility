// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "H3SPDFLIB",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "H3SPDFUTIL",
            targets: ["H3SPDFUTIL"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .binaryTarget(
            name: "H3SPDFUTIL",
            url: "https://github.com/h3sventures/H3S-PDFUtility/releases/download/v1.0.2/H3SPDFUTIL.xcframework.zip",
            checksum: "8b7f5cd1ec1671ddf09fad6973a11fd2865b6469d451f93c22e0edf157beee94"
        ),
    ]
)
