# TextFieldPalette

## Introduction
`TextFieldPalette` is a Swift package that provides a collection of customizable text fields, including `PaletteDatePickerTextField`, a text field with an integrated date picker for a seamless user experience. This package makes it easy to incorporate styled text fields into your SwiftUI applications.

<img src="https://github.com/user-attachments/assets/078dd831-1ca2-466a-a12a-005505cb3d44" alt="Simulator Screenshot - iPhone" width="400"/>

---

## Features

- **PaletteDatePickerTextField**: A text field with an integrated `UIDatePicker`.
- **Optional Date Support**: Supports nil values, making it easy to manage optional date fields.
- **Date Range Restriction**: Set a minimum and maximum date to limit selection.

---

## Installation

To integrate `TextFieldPalette` into your SwiftUI project, follow these steps:

1. Open your project in Xcode.
2. Select your project file in the Project Navigator.
3. Choose your app target and navigate to the "Package Dependencies" tab.
4. Click on the "+" button to add a new package.
5. Enter the repository URL: `https://github.com/LACHKAR99ZAKARIA/TextFieldPalette.git`.
6. Select the version to install.

---

## Usage

### Importing the Package

Before using `TextFieldPalette`, import it into your SwiftUI view:

```swift
import TextFieldPalette
```

### Example Usage

Here’s a simple example of how to integrate `PaletteDatePickerTextField`:

```swift
import SwiftUI
import TextFieldPalette

struct DemoView: View {
    @State private var selectedDate: Date? = nil // Optional date

    var body: some View {
        VStack(spacing: 20) {
            PaletteDatePickerTextField(
                selectedDate: $selectedDate,
                placeholder: "Select a date",
                minDate: Date(),
                maxDate: Calendar.current.date(byAdding: .year, value: 1, to: Date())
            )
            .padding()

            if let date = selectedDate {
                Text("Selected date: \(date, formatter: dateFormatter)")
                    .padding()
            } else {
                Text("No date selected")
                    .padding()
            }
        }
        .padding()
    }

    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }
}

struct DemoView_Previews: PreviewProvider {
    static var previews: some View {
        DemoView()
    }
}
```

---

## PaletteCustomTextField

`PaletteCustomTextField` allows you to create a customizable text field in SwiftUI, including a custom keyboard.

<img src="https://github.com/user-attachments/assets/7c7dea2b-0091-47a4-9309-7eb118d69392" alt="Custom Text Field" width="400"/>

### Example Usage

```swift
PaletteCustomTextField(
    placeholder: "Placeholder",
    text: $text
) {
    LazyVGrid(columns: columns) {
        ForEach(1...9, id: \ .self) { i in
            Text(String(i))
                .padding()
                .onTapGesture {
                    text = String(i)
                }
        }
    }
}
```

---

## Parameters

### `PaletteDatePickerTextField`
- **`selectedDate`**: A binding to the currently selected date (optional).
- **`placeholder`**: A placeholder string displayed when no date is selected.
- **`minDate`**: An optional minimum date.
- **`maxDate`**: An optional maximum date.

---

## Demo GIF

Replace this with a GIF demonstrating package usage.

---

## License
This project is licensed under the MIT License. See the `LICENSE` file for more details.

---

## Contributing
Contributions are welcome! Feel free to submit a pull request or open an issue for any improvements or bug fixes.
