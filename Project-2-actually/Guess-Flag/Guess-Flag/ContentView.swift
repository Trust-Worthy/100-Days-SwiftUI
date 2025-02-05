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
        
        
        ZStack {
            Color.blue
                .ignoresSafeArea()
            VStack(spacing: 30) {
                
                VStack {
                    Text("Tap the flag of")
                        .foregroundStyle(.white)
                    Text(countries[correctAnswer])
                }
                
                /// spacing is really nice
                
                ForEach(0..<3) { number in
                    Button {
                        // flag was tapped
                    } label: {
                        Image(countries[number])
                    }
                }
                
            }
        }
    }

   
    
}

#Preview {
    ContentView()
}
