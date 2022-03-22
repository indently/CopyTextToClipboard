//
//  ContentView.swift
//  CopyTextToClipboard
//
//  Created by Federico on 22/03/2022.
//

import SwiftUI
import UIKit

struct ContentView: View {
    @State private var text: String = ""
    @State private var buttonText  = "Copy to clipboard"
    private let pasteboard = UIPasteboard.general
    
    var body: some View {
        VStack {
            TextField("Insert text here", text: $text)
                .textFieldStyle(.roundedBorder)
            
            HStack {
                Button {
                    copyToClipboard()
                } label: {
                    Label(buttonText, systemImage: "doc.on.doc.fill")
                }
                .tint(.orange)
                Spacer()
                Button {
                    paste()
                } label: {
                    Label("Paste", systemImage: "doc.on.clipboard")
                }
            }
        }
        .padding()
    }
    
    func paste(){
        if let string = pasteboard.string {
            text = string
        }
    }
    
    func copyToClipboard() {
        pasteboard.string = self.text
        
        self.buttonText = "Copied!"
        self.text = ""
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            self.buttonText = "Copy to clipboard"
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
