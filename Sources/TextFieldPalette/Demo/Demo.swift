//
//  Demo.swift
//  TextFieldPalette
//
//  Created by Zakaria Lachkar on 13/10/2024.
//

import SwiftUI

struct DemoView: View {
    @State private var selectedDate: Date? = nil // Optional date for the date picker

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
