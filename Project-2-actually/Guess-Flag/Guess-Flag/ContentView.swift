//
//  ContentView.swift
//  Guess-Flag
//
//  Created by Trust-Worthy on 1/23/25.
//

// The colors span the width of the phone, but it depends on the model.


import SwiftUI

struct ContentView: View {
    var countries: [String] = ["Estonia","France","Germany","Ireland","Italy","Nigeria","Poland","Spain","UK","Ukraine","US"]
    
    var correctAnswer = Int.random(in: 0...2)
    
    var body: some View {
        
        VStack {
            Text("Tap the flag of")
            Text(countries[correctAnswer])
        }
       
    }

   
    
}

#Preview {
    ContentView()
}
