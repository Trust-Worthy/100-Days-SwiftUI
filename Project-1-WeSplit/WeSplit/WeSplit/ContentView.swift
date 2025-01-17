//
//  ContentView.swift
//  WeSplit
//
//  Created by Trust-Worthy on 1/14/25.
//

import SwiftUI

struct ContentView: View {
    /// Day 17 Code
    ///
    /// the values below are the values that change!
    @State private var checkAmount: Double = 0.0 // @State automatically watches for changes
    @State private var numberOfPeople: Int =  2
    @State private var tipPercentage: Int = 20
    
    
    
    let tipPercentages: [Int] = [10,15,20,25,0]
    
    var totalPerPerson: Double { // computed property
        // calculate the total per person here
        let peopleCount: Double = Double(numberOfPeople + 2)
        let tipSelection: Double = Double(tipPercentage)
        
        let tipValue: Double = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        
        
        
        return amountPerPerson
    }
    
    /// Pr
    var body: some View { /// When a state changes for a variable it will re-invoke the body property of the view
        
      
        NavigationStack {
            Form {
                Section {
                    // $checkAmount is the two way binding
                    // Amount shows when the user doesn't have anything entered
                    TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                    // Locale is a huge struct that has all the users region settings
                        .keyboardType(.decimalPad) // make the keyboard more convienient for the user when typing in checks.
                    
                    Picker("Number of people",selection: $numberOfPeople) {
                        ForEach(2..<100){
                            Text("\($0) People")
                        }
                    }
                    .pickerStyle(.navigationLink)
                    /// Declarative User Interface design
                    /// Saying what we want instead of how to make every individual thing
                }
                
                
                Section("How much do you want to tip?") { // Made a clean prompt
                    
                    Picker("Tip percentage", selection: $tipPercentage){
                        ForEach(tipPercentages, id: \.self) {
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.segmented) // this makes the slider type option
                }
                
                
                Section  {
                    Text(totalPerPerson,format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }
                
            }
            .navigationTitle("WeSplit")
            /// Views are able to show many inside them
            
            /// Segmented control
            
        }
        
    }
}

#Preview {
    ContentView()
}
