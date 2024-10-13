# TextFieldPalette

`TextFieldPalette` is a Swift package that provides a collection of customizable text fields, including a `PaletteDatePickerTextField` for selecting dates with a user-friendly interface. This package makes it easy to incorporate styled text fields into your SwiftUI applications.

<img src="https://github.com/user-attachments/assets/078dd831-1ca2-466a-a12a-005505cb3d44" alt="Simulator Screenshot - iPhone" width="400"/>  <!-- Adjust the width as needed -->

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
```

## Demo Code
Here’s a simple demo of how to use the `PaletteDatePickerTextField` in your SwiftUI application:

```
import SwiftUI
import TextFieldPalette

struct DemoView: View {
    @State private var selectedDate: Date? = nil // Optional date for the date picker

    var body: some View {
        VStack(spacing: 20) {
            // PaletteDatePickerTextField for selecting a date
            PaletteDatePickerTextField(selectedDate: $selectedDate,
                                        placeholder: "Select Date",
                                        minDate: Date(), // Minimum date is today
                                        maxDate: Calendar.current.date(byAdding: .year, value: 1, to: Date())) // Maximum date is one year from now
                .padding()

            // Display the selected date
            if let date = selectedDate {
                Text("Selected date: \(date, formatter: dateFormatter)")
                    .padding()
            } else {
                Text("No date selected")
                    .padding()
            }
        }
        .padding() // Padding for the entire view
    }

    // Date formatter for displaying the selected date
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

## Demo GIF
<!-- Replace with your GIF path -->

Parameters
- **`selectedDate`**: A binding to the currently selected date (optional).
- **`placeholder`**: A placeholder string that appears in the text field when no date is selected.
- **`minDate`**: An optional minimum date for the date picker.
- **`maxDate`**: An optional maximum date for the date picker.
  
## License
This project is licensed under the MIT License. See the LICENSE file for more details.

## Contributing
Contributions are welcome! Please feel free to submit a pull request or open an issue for any improvements or bugs.


### Adjustments Made:
- Changed the code block notation from ```swift to `/swift` for compatibility.
- Made sure the formatting is clear and professional for a README.

Feel free to replace the GIF path placeholder with the actual path to your demo GIF. If you have any more changes or requests, just let me know!
