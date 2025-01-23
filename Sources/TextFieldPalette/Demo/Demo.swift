//
//  Demo.swift
//  TextFieldPalette
//
//  Created by Zakaria Lachkar on 13/10/2024.
//

import SwiftUI

struct DemoView: View {
    @State private var selectedDate: Date? = nil // Optional date for the date picker
    
//    @FocusState private var focussed: Bool
    @State private var height: CGFloat = .zero
    @State private var text = ""
    @State private var focussed = false
    
    let columns = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                // PaletteDatePickerTextField for selecting a date
                PaletteDatePickerTextField(selectedDate: $selectedDate,
                                            placeholder: "Select Date",
                                            minDate: Date(), // Minimum date is today
                                           maxDate: Calendar.current.date(byAdding: .year, value: 1, to: Date()), action: action) // Maximum date is one year from now
                
                PaletteDatePickerTextField(selectedDate: $selectedDate,
                                            placeholder: "Select Date",
                                            minDate: Date(), // Minimum date is today
                                           maxDate: Calendar.current.date(byAdding: .year, value: 1, to: Date()), showDoneButton: false, action: action)
                
                PaletteDatePickerTextField(selectedDate: $selectedDate,
                                            placeholder: "Select Date",
                                            minDate: Date(), // Minimum date is today
                                           maxDate: Calendar.current.date(byAdding: .year, value: 1, to: Date()), showCancelButton: false, action: action)
                
                PaletteDatePickerTextField(selectedDate: $selectedDate,
                                            placeholder: "Select Date",
                                            minDate: Date(), // Minimum date is today
                                           maxDate: Calendar.current.date(byAdding: .year, value: 1, to: Date()), showCancelButton: false, showDoneButton: false, action: action)
                
                // Text Field with custom Keyboard
                PaletteCustomTextField(
                    placeholder: "placeholder",
                    text: text
                ) {
                    LazyVGrid(
                        columns: columns) {
                            ForEach(1...9, id: \.self) { i in
                                Text(String(i))
                                    .padding()
                                    .onTapGesture {
                                        text = String(i)
                                    }
                            }
                        }
                }
            }
            .padding()
        }
    }
    
    private var action: () -> Void = { }

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
