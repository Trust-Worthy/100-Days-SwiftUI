//
//  ContentView.swift
//  TimeTime
//
//  Created by Trust-Worthy on 9/26/26.
//

import SwiftUI

enum TimeUnit: Int {
    case seconds = 1
    case minutes = 60
    case hours = 3600
    case days = 86_400
    case weeks = 604_800
    
    var id: Self {self}
    
    var name: String {
        switch self {
            case .seconds: return "Seconds"
            case .minutes: return "Minutes"
            case .hours: return "Hours"
            case .days: return "Days"
            case .weeks: return "Weeks"
        }
    }
    
}

struct ContentView: View {
    
//    @State private var inputTimeUnit = "Seconds"
    @State private var inputTimeUnit
    @State private var timeAmount: Double = 0.0
//    @State private var outputTimeUnit = "Minutes"
    
//    let timeUnits: [String] = ["Seconds","Minutes","Hours","Days","Weeks"]
    
    var convertedTime: Double {
        return 0
    }
    
    var body: some View {
        NavigationStack {
            
            Form {
                
                Section("Units") {
                    Picker("Input Time Unit", selection: $inputTimeUnit) {
                        ForEach(timeUnits,  id: \.self) {
                            Text("\($0)")
                        }
                    }
                    
                    Picker("Output Time Unit", selection: $outputTimeUnit) {
                        ForEach(timeUnits, id: \.self) {
                            Text("\($0)")
                        }
                    }
                }
                
                Section ("Enter Time To Convert from \(inputTimeUnit)") {
                    TextField("Enter Amount", value: $timeAmount, format: .number)
                    
                }
                
                Section("Converted Time to \(outputTimeUnit)") {
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
