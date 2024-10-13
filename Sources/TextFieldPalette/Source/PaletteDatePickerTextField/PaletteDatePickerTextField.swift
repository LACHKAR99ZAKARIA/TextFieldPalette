//
//  PaletteDatePickerTextField.swift
//  TextFieldPalette
//
//  Created by Zakaria Lachkar on 13/10/2024.
//

import SwiftUI
import UIKit

public struct PaletteDatePickerTextField: UIViewRepresentable {
    @Binding var selectedDate: Date?
    let placeholder: String
    let minDate: Date?
    let maxDate: Date?

    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }

    public init(selectedDate: Binding<Date?>, placeholder: String, minDate: Date? = nil, maxDate: Date? = nil) {
        self._selectedDate = selectedDate
        self.placeholder = placeholder
        self.minDate = minDate
        self.maxDate = maxDate
    }

    public func makeUIView(context: Context) -> UITextField {
        let textField = UITextField()
        textField.placeholder = placeholder
        textField.text = selectedDate.map { dateFormatter.string(from: $0) }
        
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.minimumDate = minDate
        datePicker.maximumDate = maxDate
        datePicker.addTarget(context.coordinator, action: #selector(Coordinator.dateChanged(_:)), for: .valueChanged)
        
        textField.inputView = datePicker
        
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: context.coordinator, action: #selector(Coordinator.donePressed))
        toolbar.setItems([doneButton], animated: true)
        textField.inputAccessoryView = toolbar

        return textField
    }

    public func updateUIView(_ uiView: UITextField, context: Context) {
        uiView.text = selectedDate.map { dateFormatter.string(from: $0) }
    }

    public func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }

    public class Coordinator: NSObject {
        let parent: PaletteDatePickerTextField

        init(_ parent: PaletteDatePickerTextField) {
            self.parent = parent
        }

        @MainActor @objc func dateChanged(_ sender: UIDatePicker) {
            parent.selectedDate = sender.date
        }

        @MainActor @objc func donePressed() {
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        }
    }
}
