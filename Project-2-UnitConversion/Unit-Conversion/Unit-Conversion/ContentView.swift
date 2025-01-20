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
    //@State private var userConversionType: String = ""
    
    
    let timeOptions: [String] = ["seconds","minutes","hours","days"]
    // let temperatureOptions: [String] = ["Celsius","Farenheit","Kelvin"]
    
    
    
    /// Creating a computed property to convert the user input value into the desired
    /// and proper output unit
    var convertedValue: Double {
        
        
        return 0
    }
    var body: some View {
        NavigationStack {
            Form {
                
            }
        }
}

#Preview {
    ContentView()
}
