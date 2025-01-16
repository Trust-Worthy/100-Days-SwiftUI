//
//  ContentView.swift
//  WeSplit
//
//  Created by Trust-Worthy on 1/14/25.
//

import SwiftUI

struct ContentView: View {
    /// Day 17 Code
    @State private var checkAmount: Double = 0.0
    @State private var numberOfPeople: Int =  2
    @State private var tipPercentage: Int = 20
    
    
    let tipPercentages: [Int] = [10,15,20,25,0]
    
    
    var body: some View {
        Text("Hello, Mom & Dad!")
        
    }
}

#Preview {
    ContentView()
}
