//
//  ContentView.swift
//  WeSplit
//
//  Created by Trust-Worthy on 1/14/25.
//

import SwiftUI

struct ContentView: View {
    /// Day 17 Code
    @State private var checkAmount: Double = 0.0 // @State automatically watches for changes
    @State private var numberOfPeople: Int =  2
    @State private var tipPercentage: Int = 20
    
    
    let tipPercentages: [Int] = [10,15,20,25,0]
    
    
    var body: some View {
        Form {
            Section {
                // $checkAmount is the two way binding
                // Amount shows when the user doesn't have anything entered
                TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                // Locale is a huge struct that has all the users region settings
            }
            
            Section  {
                Text(checkAmount,format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
            }
            
        }
        
    }
}

#Preview {
    ContentView()
}
