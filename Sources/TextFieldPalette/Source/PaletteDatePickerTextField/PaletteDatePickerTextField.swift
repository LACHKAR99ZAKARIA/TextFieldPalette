//
//  PaletteDatePickerTextField.swift
//  TextFieldPalette
//
//  Created by Zakaria Lachkar on 13/10/2024.
//

import SwiftUI
import UIKit

public struct PaletteDatePickerTextField: UIViewRepresentable {
    @Binding public var selectedDate: Date?
    public let placeholder: String
    public let minDate: Date?
    public let maxDate: Date?
    public var showCancelButton: Bool = true
    public var showDoneButton: Bool = true
    public let action: (() -> Void)?
    
    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }
    
    public init(selectedDate: Binding<Date?>, placeholder: String, minDate: Date? = nil, maxDate: Date? = nil, showCancelButton: Bool = true, showDoneButton: Bool = true, action: (() -> Void)? = nil) {
        self._selectedDate = selectedDate
        self.placeholder = placeholder
        self.minDate = minDate
        self.maxDate = maxDate
        self.action = action
        self.showCancelButton = showCancelButton
        self.showDoneButton = showDoneButton
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
        
        var items = [UIBarButtonItem]()
        
        if showCancelButton {
            let cancelButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: context.coordinator, action: #selector(Coordinator.cancelPressed))
            items.append(cancelButton)
        }
        
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        items.append(flexibleSpace)
        
        if showDoneButton {
            let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: context.coordinator, action: #selector(Coordinator.donePressed))
            items.append(doneButton)
        }
        
        if showDoneButton || showCancelButton {
            toolbar.setItems(items, animated: true)
            textField.inputAccessoryView = toolbar
        }

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
            if let action = parent.action {
                action()
            }
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        }
        
        @MainActor @objc func cancelPressed() {
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
            parent.selectedDate = nil
        }
    }
}
