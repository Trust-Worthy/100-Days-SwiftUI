//
//  ContentView.swift
//  TimeTime
//
//  Created by Trust-Worthy on 9/26/26.
//

import SwiftUI

enum TimeUnit: Double, Identifiable, CaseIterable {
    case second = 1
    case secondsInMinutes = 60
    case secondsInHours = 3600
    case secondsInDays = 86_400
    case secondsInWeeks = 604_800
    
    var id: Self {self}
    
    var name: String {
        switch self {
            case .second: return "Seconds"
            case .secondsInMinutes: return "Minutes"
            case .secondsInHours: return "Hours"
            case .secondsInDays: return "Days"
            case .secondsInWeeks: return "Weeks"
        }
    }
    
    
}

struct ContentView: View {
    
    @State private var inputTimeUnit: TimeUnit = .second
    @State private var timeAmount: Double = 0.0
    @State private var outputTimeUnit: TimeUnit = .secondsInMinutes
    
    
    private var convertedTime: Double {
        // What is 5 hours in seconds
        // What is the base Unit in seconds?
        // ex: amount = 5 baseTime = hours -> 5 * 3600
        let baseTimeInSeconds = timeAmount * inputTimeUnit.rawValue
        
        // What it the output unit in seconds?
        // ex: base Unit is days
        let outputUnitInSeconds = outputTimeUnit.rawValue
        
        
        // How do I know whether I'm supposed to dive of multiply?
        // Always divide?
        return baseTimeInSeconds / outputUnitInSeconds
    }
    
    
    var body: some View {
        NavigationStack {
            
            Form {
                
                Section("Units") {
                    Picker("Input Time Unit", selection: $inputTimeUnit) {
                        ForEach(TimeUnit.allCases) { unit in
                            Text(unit.name).tag(unit)
                        }
                    }
                    
                    Picker("Output Time Unit", selection: $outputTimeUnit) {
                        ForEach(TimeUnit.allCases) { unit in
                            Text(unit.name)
                                .tag(unit)
                        }
                    }
                }
                
                Section ("Enter Time To Convert from \(inputTimeUnit.name)") {
                    TextField("Enter Amount", value: $timeAmount, format: .number)
                        .keyboardType(.decimalPad)
                    
                }
                
                Section("Converted Time to \(outputTimeUnit.name)") {
                    Text(convertedTime, format: .number)
                      
                }
                
            }
            .navigationTitle("Time Time")
        }
        
    }
}

#Preview {
    ContentView()
}
