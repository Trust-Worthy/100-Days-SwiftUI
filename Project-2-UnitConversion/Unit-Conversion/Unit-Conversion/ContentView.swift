//
//  ContentView.swift
//  Unit-Conversion
//
//  Created by Jonathan Bateman on 1/20/25.
//  Assignment:
// Build an app that handles unit conversions
//
// Users will select an input unit and an output unit
// Enter a value
// Then see the output of the conversion

import SwiftUI

struct ContentView: View {
    /// Day 19 Challenge App
    
    @State private var userInputValue: Double = 0.0
    @State private var userInputUnit: String = ""
    @State private var userOutputUnit: String = ""
    
    let timeOptions = ["seconds","minutes","hours","days"]
    let temperature
    
    /// Creating a computed property to convert the user input value into the desired
    /// and proper output unit
    var convertedValue: Double {
        
    }
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
