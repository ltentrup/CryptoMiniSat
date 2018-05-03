// swift-tools-version:4.0

import PackageDescription

let package = Package(
    name: "CryptoMiniSat",
    products: [
        .library(name: "CryptoMiniSat", type: .static, targets: ["CryptoMiniSat"]),
    ],
    dependencies: [
        .package(url: "https://github.com/ltentrup/SATSolver.git", from: "0.1.0")
    ],
    targets: [
        .target(
            name: "CppCryptoMiniSat",
            dependencies: []
        ),
        .target(
            name: "CCryptoMiniSat",
            dependencies: [
                "CppCryptoMiniSat"
            ]
        ),
        .testTarget(name: "CCryptoMiniSatTests", dependencies: ["CCryptoMiniSat"]),
        .target(
            name: "CryptoMiniSat",
            dependencies: [
                "SATSolver",
                "CCryptoMiniSat"
            ]
        ),
        .testTarget(name: "CryptoMiniSatTests", dependencies: ["CryptoMiniSat"]),
    ],
    cxxLanguageStandard: .cxx11
)
