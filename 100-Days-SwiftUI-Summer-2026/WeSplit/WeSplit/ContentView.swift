//
//  ContentView.swift
//  WeSplit
//
//  Created by Jonathan Bateman on 9/24/26.
//

import SwiftUI

struct ContentView: View {
    @State private var name = ""
    var body: some View {
        Form {
            TextField("Enter your name", text: $name) // two way binding
            Text("Your name is \(name)") // just read the val
        }
        
       
    }
}

#Preview {
    ContentView()
}
