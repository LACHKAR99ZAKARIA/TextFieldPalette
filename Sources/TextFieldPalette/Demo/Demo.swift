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
