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
    @FocusState private var amountIsFocused: Bool // just like State but used to handle focused input in our UI
    
    
    
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
                        .focused($amountIsFocused) // SwiftUI becomes aware when this Textfield is focused
                        // two way binding on amount is focused
                    
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
                        ForEach(0..<101) {
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.navigationLink) // this makes the slider type option
                }
                
                
                Section("Amount per person")  {
                    Text(totalPerPerson,format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }
                
                Section("Final Check Balance Owed") {
                    let tipValue: Double = checkAmount / 100 * Double(tipPercentage)
                    Text("$\(checkAmount + tipValue)")
                }
//                
            }
            .navigationTitle("WeSplit")
            /// Views are able to show many inside them
            .toolbar { //
                if amountIsFocused {
                    Button("Done") { // Only show button when amountIsFocused is set to true
                        amountIsFocused = false // Keyboard gets dismissed
                    }
                }
            }
            /// Segmented control
            
        }
        
    }
}

#Preview {
    ContentView()
}
