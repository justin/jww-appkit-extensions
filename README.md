# JWWAppKit

[![CI](https://github.com/justinwilliams/jww-appkit-extensions/workflows/CI/badge.svg)](https://github.com/justinwilliams/jww-appkit-extensions/actions)
[![Swift Package Manager](https://img.shields.io/badge/SPM-compatible-brightgreen.svg)](https://swift.org/package-manager/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

A collection of useful extensions and utilities for AppKit-based macOS applications built with Swift.

## What is JWWAppKit?

JWWAppKit provides convenient extensions and helper classes for common AppKit development tasks, making it easier to work with NSView, NSViewController, gesture recognizers, and image views in your macOS applications. It streamlines common patterns and reduces boilerplate code.

## System Requirements

- **macOS**: 14.0 or later
- **Swift**: 6.0 or later
- **Xcode**: 15.1 or later (for development)

## Features

### NSView Extensions

- **Auto Layout Convenience**: The `usesAutoLayout` property provides a convenient getter/setter for managing Auto Layout constraints on views.

```swift
let view = NSView()
view.usesAutoLayout = true  // Cleaner than translatesAutoresizingMaskIntoConstraints
```

### Gesture Recognizer Extensions

- **Button Mask Convenience**: A strongly-typed `ButtonMask` option set for gesture recognizers that replaces magic numbers with descriptive constants.

```swift
let panGestureRecognizer = NSPanGestureRecognizer()
panGestureRecognizer.requiredButtons = [.primary, .secondary]
```

Supported buttons:
- `.primary` - Left mouse button
- `.secondary` - Right mouse button
- `.other` - Third mouse button

### Image Views

- **Aspect Fill Image View**: An `ImageAspectFillView` class that displays images with aspect fill content mode, useful for thumbnail views and image galleries.

```swift
let imageView = ImageAspectFillView(image: myImage)
stackView.addArrangedSubview(imageView)
```

### View Loading from XIB Files

- **XIB Initialization Protocol**: The `XibInitializable` protocol simplifies loading custom views from `.xib` files with sensible defaults.

```swift
class MyCustomView: NSView, XibInitializable {
    @IBOutlet var contentView: NSView!

    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        loadFromXib()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadFromXib()
    }
}
```

### View Controller Loading from Storyboards

- **Storyboard Initialization Protocol**: The `StoryboardInitializable` protocol makes it easy to instantiate view controllers from storyboards with type safety.

```swift
class MyViewController: NSViewController, StoryboardInitializable {
    // Automatically uses class name as the storyboard identifier
}

// Usage
let storyboard = NSStoryboard(name: "Main", bundle: nil)
let viewController = MyViewController.instantiateFromStoryboard(storyboard)
```

### Property Wrapper for View Loading

- **JWWViewLoading Property Wrapper**: A `@propertyWrapper` that defers view instantiation until first access, useful for lazy initialization patterns.

## Installation

### Swift Package Manager

Add JWWAppKit to your `Package.swift`:

```swift
let package = Package(
    name: "MyApp",
    dependencies: [
        .package(url: "https://github.com/justinwilliams/jww-appkit-extensions.git", from: "1.0.0")
    ],
    targets: [
        .target(
            name: "MyApp",
            dependencies: ["JWWAppKit"]
        )
    ]
)
```

Or in Xcode, go to **File > Add Packages** and enter:
```
https://github.com/justinwilliams/jww-appkit-extensions.git
```

## Usage

Import the package in your Swift files:

```swift
import JWWAppKit
```

Then use any of the available extensions and utilities as shown in the features section above.

## Testing

Run the included tests with:

```bash
swift test
```

Or in Xcode:

```bash
xcodebuild -scheme JWWAppKit test
```

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Contributing

Contributions are welcome! Please feel free to open issues or submit pull requests.
