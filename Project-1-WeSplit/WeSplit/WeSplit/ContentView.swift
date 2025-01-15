//
//  ContentView.swift
//  WeSplit
//
//  Created by Trust-Worthy on 1/14/25.
//

import SwiftUI

struct ContentView: View {
//    var body: some View {
//        NavigationStack {
//            Form {
//                Section {
//                    Text("Hello, world!")
//                    Text("Hello, world!")
//                    Text("Hello, world!")
//                }
//                
//                Section {
//                    Text("Hello, world!")
//                    Text("Hello, world!")
//                    Text("Hello, world!")
//                }
//                
//                
//                Text("Hello, world!")
//                
//            }
//            .navigationTitle("SwiftUI")
//            .navigationBarTitleDisplayMode(.inline)
//        }
//        
//    }
    /// Swift UI wants to know how to read & write to the name var
    @State private var name = ""
    
    
    var body: some View {
        Form {
            TextField("Enter you name sir",text: $name)
            /// $name creates a two-way binding so that you can update the text and display the updated text
            Text("Your name is: \(name)") /// Just writing name means I want to just read the name var
        }
    }
}

#Preview {
    ContentView()
}
