//
//  ContentView.swift
//  Guess-Flag
//
//  Created by Trust-Worthy on 1/23/25.
//

// The colors span the width of the phone, but it depends on the model.


import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            //Color.primary // flips colors --> semantic colors
            //Color.indigo // This is a view in its own right
            Color(red:234,green: 0.8, blue:123) // Make your own color
                //.frame(width: 200,height:200)
                //.frame(minWidth: 200, maxWidth: .infinity, maxHeight: 200) // This makes it flexible
            Text("Your content")
        }
        //.background(.blue) Just the background of the Text object
        .ignoresSafeArea() // all important context should be in the safe area!!
        
    }
}

#Preview {
    ContentView()
}
