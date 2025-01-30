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
    public let text: String?
    public var content: Content
    
    public init(
        placeholder: String,
        text: String?,
        content: () -> Content
    ) {
        self.placeholder = placeholder
        self.text = text
        self.content = content()
    }
    
    public func makeUIView(context: Context) -> UITextField {
        let textField = UITextField()
        textField.placeholder = placeholder
        
        let hostingVC = UIHostingController(rootView: content)
        let inputView = UIView()
        
        hostingVC.view.sizeToFit()
        inputView.frame = hostingVC.view.frame
        
        inputView.addSubview(hostingVC.view)
        
        
        hostingVC.view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            hostingVC.view.rightAnchor.constraint(equalTo: inputView.rightAnchor),
            hostingVC.view.leftAnchor.constraint(equalTo: inputView.leftAnchor),
            hostingVC.view.topAnchor.constraint(equalTo: inputView.topAnchor),
            hostingVC.view.bottomAnchor.constraint(equalTo: inputView.bottomAnchor),
        ])
        
        textField.inputView = inputView
        
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        var items = [UIBarButtonItem]()
        
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        items.append(flexibleSpace)

        return textField
    }

    public func updateUIView(_ uiView: UITextField, context: Context) {
        uiView.text = self.text
    }

    public func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }
    
    public class Coordinator: NSObject {
        let parent: PaletteCustomTextField

        init(_ parent: PaletteCustomTextField) {
            self.parent = parent
        }
    }
}
