//
//  PaletteCustomTextField.swift
//  TextFieldPalette
//
//  Created by Zakaria Lachkar on 21/1/2025.
//


import SwiftUI
import UIKit

public struct PaletteCustomTextField<Content: View>: UIViewRepresentable {
    public let placeholder: String
    public var showCancelButton: Bool = true
    public var showDoneButton: Bool = true
    public var content: Content
    public let action: (() -> Void)?
    
    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }
    
    public init(
        placeholder: String,
        showCancelButton: Bool = true,
        showDoneButton: Bool = true,
        content: () -> Content,
        action: (() -> Void)? = nil
    ) {
        self.placeholder = placeholder
        self.action = action
        self.showCancelButton = showCancelButton
        self.showDoneButton = showDoneButton
        self.content = content()
    }
    
    public func makeUIView(context: Context) -> UITextField {
        let textField = UITextField()
        textField.placeholder = placeholder
        
        let hostingVC = UIHostingController(rootView: content)
        var inputView = UIView()
        
        inputView.addSubview(hostingVC.view)
//        hostingVC.didMove(toParent: self)
        
        
        hostingVC.view.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            
//        ])
        
        textField.inputView = inputView
        
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
//        uiView.text = selectedDate.map { dateFormatter.string(from: $0) }
    }

    public func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }
    
    public class Coordinator: NSObject {
        let parent: PaletteCustomTextField

        init(_ parent: PaletteCustomTextField) {
            self.parent = parent
        }
        
        @MainActor @objc func donePressed() {
            if let action = parent.action {
                action()
            }
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        }
        
        @MainActor @objc func cancelPressed() {
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        }
    }
}
