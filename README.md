# Calculator — Advanced Swift iOS

A native iOS calculator app built with **Swift** and **UIKit**, demonstrating clean architecture, stateful calculation logic, and storyboard-based UI. Built as a portfolio project to showcase iOS development fundamentals and app structure.

---

## Overview

| Field | Value |
|-------|--------|
| **Platform** | iOS (iPhone & iPad) |
| **Language** | Swift 5.0 |
| **UI Framework** | UIKit, Storyboards |
| **Min. iOS** | 13.0 |
| **Architecture** | MVC |
| **Dependencies** | None (vanilla Swift) |

---

## Features

- **Basic arithmetic** — Addition (+), subtraction (−), multiplication (×), division (÷)
- **Unary operations** — Sign toggle (+/−), percentage (%), clear (AC)
- **Decimal support** — Full decimal number input and display
- **Chained calculations** — Sequential two-operand operations (e.g. `5 + 3 =` → `8`)
- **Portrait & landscape** — Supports multiple orientations on iPhone and iPad
- **Dark UI** — Display and button layout with a dark theme

---

## Project Structure

```text
Calculator/
├── AppDelegate.swift           # App lifecycle
├── Info.plist                  # App configuration & capabilities
├── Controllers/
│   └── ViewController.swift    # Main screen logic, button handling, display binding
├── Models/
│   └── CalculatorLogic.swift  # Calculation state and arithmetic logic
├── Views/
│   └── Base.lproj/
│       └── Main.storyboard     # Calculator layout (display + button grid)
├── Base.lproj/
│   └── LaunchScreen.storyboard
└── Assets.xcassets             # App icon and assets
```

**Design notes:**

- **CalculatorLogic** holds the current value and pending operation; it is **stateful** (mutating methods) and returns results for display.
- **ViewController** owns the display label, maps user input to the model, and updates the UI from model results.
- UI is built with **Auto Layout** and **stack views** in the storyboard for a responsive grid.

---

## Requirements

- **Xcode** (recommended: latest stable)
- **macOS** (for building and running the simulator)
- **iOS 13.0+** device or simulator
- **Apple Developer account** (for running on a physical device)

---

## Getting Started

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd Calculator-Advanced-Swift-iOS
   ```

2. **Open in Xcode**
   ```bash
   open Calculator.xcodeproj
   ```

3. **Select a target**
   - Choose the **Calculator** scheme.
   - Pick an iPhone or iPad simulator (or a connected device).

4. **Build and run**
   - Press **⌘R** or use **Product → Run**.

No external dependencies or package managers; the project uses only the iOS SDK.

---

## Technical Highlights

- **Separation of concerns** — Calculation logic lives in `CalculatorLogic`; the view controller only handles I/O and state binding.
- **Optional handling** — Uses Swift optionals and `if let` for safe result handling between model and UI.
- **Computed property** — `displayValue` on `ViewController` centralizes conversion between display string and `Double` for the model.
- **Storyboard + outlets** — `UILabel` for the display and `UIButton` actions (`calcButtonPressed`, `numButtonPressed`) keep UI and behavior clearly connected.

---

## Screenshots

_Add screenshots of the calculator (e.g. portrait and landscape) for your portfolio._

---

## Author

**Michael Peralta**  
Portfolio project — iOS development.

---
