//
//  ContentView.swift
//  WeSplit
//
//  Created by Jonathan Bateman on 9/24/26.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount: Double = 0.0
    @State private var numberOfPeople: Int  = 2
    @State private var tipPercentage: Int = 20
    
    let tipPercentages: [Int] = [10,15,20,25,0]
    
    var body: some View {
        
        NavigationStack {
            
            Form {
                
                // Amount & Number of people
                Section {
                    TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .keyboardType(.decimalPad)
                    
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2..<100) {
                            Text("\($0) people")
                        }
                    }
                }
                
                // 
                Section {
                    Text(checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }
            }
            .navigationTitle("WeSplit")
        }
    }
}

#Preview {
    ContentView()
}
