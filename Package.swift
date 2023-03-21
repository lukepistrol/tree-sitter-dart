// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "TreeSitterDart",
    platforms: [.macOS(.v10_13), .iOS(.v11)],
    products: [
        .library(name: "TreeSitterDart", targets: ["TreeSitterDart"]),
    ],
    dependencies: [],
    targets: [
        .target(name: "TreeSitterDart",
                path: ".",
                exclude: [
                    "binding.gyp",
                    "bindings",
                    "Cargo.toml",
                    "grammar.js",
                    "package.json",
                    "README.md",
                    "src/grammar.json",
                    "src/node-types.json",
                    // any additional files to exclude 
                ],
                sources: [
                    "src/parser.c",
                    "src/scanner.c", // this might be `scanner.c` or not present at all
                ],
                resources: [
                    .copy("queries")
                ],
                publicHeadersPath: "bindings/swift",
                cSettings: [.headerSearchPath("src")])
    ]
)
