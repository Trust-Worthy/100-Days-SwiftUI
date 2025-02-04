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
        Text("Hello, world!")
        Text("This is another text view.")
        
//        Image(decorative: "Estonia") // iOS screen reader won't read it out.
//        Image(systemName: "pencil.circle") // writing code that is sensitive to screen readers is really really important
//            .foregroundStyle(.red)
//            .font(.largeTitle)
    }
        
        // customizing the button
//        Button {
//            // trailing closure
//            print("Button was tapped")
//        } label: {
//            Text("Tap me!")
//                .padding()
//                .foregroundStyle(.white)
//                .background(.red)
//
//        }
        
        
        
        
        //        Button("Delete selection", role: .destructive, action: executeDelete)
//        VStack {
//            
//            Button("Blue Pill") { }
//                .buttonStyle(.bordered)
//            
//            Button("Red Pill", role:.destructive) { }
//                .buttonStyle(.bordered)
//            
//            Button("Button 3") { }
//                .buttonStyle(.borderedProminent) // Don't use prominent too much!
//                .tint(.indigo)
//            
//            Button("Button 4", role:.destructive) { }
//                .buttonStyle(.borderedProminent)
//        }
        
        
    
        
    func executeDelete() {
        print("Now deleting...")
    }
        
        
        
        
        /// 4 kinds of gradients to use
        /// 1. array of colors to show
        /// 2. size and dir info
        /// 3. kind of gradient
        /// linear gradient --> shows it in a straight line
        /// radial gradient --> shows how far colors in terms of radius
        /// angular / conic gradient --> cycle colors around the circle
        /// simple --> .gradient after an color. Very simple
        
//        Text("Your content")
//            .frame(maxWidth: .infinity, maxHeight: .infinity)
//            .foregroundColor(.white)
//            .background(.blue.gradient)
        //AngularGradient(colors: [.red, .yellow,.green, .blue,.purple],center: .center) // dope rainbow!
//        RadialGradient(colors: [.blue,.black], center: .center, startRadius: 20, endRadius: 200) // Ok that just looks really freaking cool
        
        
//        LinearGradient(stops: [ // allows more fine tuning of the gradient
//            .init(color: .white, location: 0.45), //  the gradient is going from .45 - .55
//            .init(color: .black, location: 0.55)
//        ], startPoint: .top, endPoint: .bottom)
        
        
//        ZStack {
//            // ** Things at the top of the Z stack are written first.
//            // ** Then things below are written on top
//            VStack(spacing: 0){
//                Color.red
//                Color.blue
//            }
//            //Color.primary // flips colors --> semantic colors
//            //Color.indigo // This is a view in its own right
//            //Color(red:234,green: 0.8, blue:123) // Make your own color
//                //.frame(width: 200,height:200)
//                //.frame(minWidth: 200, maxWidth: .infinity, maxHeight: 200) // This makes it flexible
//            Text("Your content")
//                .foregroundStyle(.secondary)
//                .padding(50)
//                .background(.ultraThinMaterial) // Frosted glass effect
//            // iOS called vibrancy. Makes text standout on any background!
//            
//        }
//        //.background(.blue) Just the background of the Text object
//        .ignoresSafeArea() // all important context should be in the safe area!!
//        
        
        
    
}

#Preview {
    ContentView()
}
