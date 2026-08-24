//
//  ContentView.swift
//  WeSplit
//
//  Created by Jonathan Bateman on 7/20/26.
//

import SwiftUI

struct ContentView: View {
    
    // use state for properties that are in 1 view only
    @State private var tapCount = 0
    
    var body: some View {
        
        Button("Tap Count: \(tapCount)") {
            tapCount += 1
        }
        
    }
}

#Preview {
    ContentView()
}
