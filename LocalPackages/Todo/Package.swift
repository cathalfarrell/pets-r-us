// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Todo",
    platforms: [
            .iOS(.v16)
        ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "Todo",
            targets: ["Todo"]),
    ],
    dependencies: [
            // Runtime dependencies (used by the generated client code)
            .package(
                url: "https://github.com/apple/swift-openapi-runtime",
                from: "1.0.0"
            ),
            .package(
                url: "https://github.com/apple/swift-openapi-generator",
                from: "1.0.0"
            ),
            .package(
                url: "https://github.com/apple/swift-openapi-urlsession",
                from: "1.0.0")
        ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "Todo",
            dependencies: [
                .product(name: "OpenAPIRuntime", package: "swift-openapi-runtime"),
                .product(name: "OpenAPIURLSession", package: "swift-openapi-urlsession")
                // If you're using AsyncHTTPClient, you can also add:
                // .product(name: "OpenAPIAsyncHTTPClient", package: "swift-openapi-runtime")
            ],
            // Plugin (used to generate the client code from your OpenAPI spec)
            plugins: [
                .plugin(name: "OpenAPIGenerator", package: "swift-openapi-generator")
            ]
        )


    ]
)
