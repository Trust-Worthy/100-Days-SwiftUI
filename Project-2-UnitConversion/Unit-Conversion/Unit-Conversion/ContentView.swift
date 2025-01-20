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
    
    var inputUnit = ""
    var outputunit = ""
    
    //@State private var userConversionType: String = ""
    
    
    let timeUnits: [String] = ["seconds","minutes","hours","days"]
    // let temperatureOptions: [String] = ["Celsius","Farenheit","Kelvin"]
    
    
    
    /// Creating a computed property to convert the user input value into the desired
    /// and proper output unit
    var convertedValueSec: Double {
        var answer: Double = 0
        
        switch userInputUnit {
        case "minutes":
             answer = userInputValue * 60 // 3 min = 3 * 60 = 180 seconds
            break
        case "hours":
            answer = userInputValue * 3600 // 2 hours = 2 * 3600 = 7200 seconds
            break
        case "days":
            answer = userInputValue * 86_400
            break
        default:
            answer =  userInputValue // defaults to user input value being in seconds
        }
        
        return answer
    }
    
    var convertedValueOutputUnit: Double {
        var answer: Double = 0
        
        switch userOutputUnit {
            
        case "minutes":
            answer = convertedValueSec / 60 // 180 seconds / 60 = 3 min
            break
        case "hours":
            answer = convertedValueSec / 3600 // 7200 / 3600 = 2 hours
            break
        case "days":
            
            answer = userInputValue / 86_400 // converts seconds into days
            break
        default:
            return userInputValue // defaults to user output value being in seconds
        }
        return answer
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Time Units") {
                  
                    
                    Picker("Select Input Time Unit",selection: $userInputUnit) {
                        ForEach(timeUnits, id:\.self) {
                            Text($0)
                        }
                    }
                   
                    Picker("Select Output Time Unit",selection: $userOutputUnit) {
                        ForEach(timeUnits, id:\.self) {
                            Text($0)
                        }
                    }
                    
                }
                
                Section("Input time in \(userInputUnit)"){
                    TextField("Time",value: $userInputValue,formatter: NumberFormatter())
                        .keyboardType(.numberPad)
                    
                }
                
                Section("Converted time in \(userOutputUnit)"){
                    Text("\(convertedValueOutputUnit.formatted())")
                        
                    
                }
                
            }
            .navigationTitle("Unit Converter")
        }
        
    }
}
#Preview {
    ContentView()
}
