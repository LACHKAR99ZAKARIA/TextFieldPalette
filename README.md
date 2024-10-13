# TextFieldPalette

`TextFieldPalette` is a Swift package that provides a collection of customizable text fields, including a `PaletteDatePickerTextField` for selecting dates with a user-friendly interface. This package makes it easy to incorporate styled text fields into your SwiftUI applications.

## Features

- **PaletteDatePickerTextField**: A date picker integrated into a text field that allows users to select a date using a `UIDatePicker`.
- **Optional Date Support**: Allows for nil values, making it easy to manage dates that may not always be set.
- **Date Range Limitation**: Specify minimum and maximum dates to restrict user selection.

## Installation

To integrate `TextFieldPalette` into your SwiftUI project, follow these steps:

1. Open your project in Xcode.
2. Select your project file in the Project Navigator.
3. Choose your app target and navigate to the "Package Dependencies" tab.
4. Click on the "+" button to add a new package.
5. Enter the package repository URL: `https://github.com/LACHKAR99ZAKARIA/TextFieldPalette.git`.
6. Choose the version to install.

## Usage

### Importing the Package

To use `TextFieldPalette`, import it into your SwiftUI view:

```swift
import TextFieldPalette
