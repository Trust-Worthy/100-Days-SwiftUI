//
//  ContentView.swift
//  WeSplit
//
//  Created by Trust-Worthy on 1/14/25.
//

import SwiftUI

struct ContentView: View {
//    var body: some View {
//        NavigationStack {
//            Form {
//                Section {
//                    Text("Hello, world!")
//                    Text("Hello, world!")
//                    Text("Hello, world!")
//                }
//                
//                Section {
//                    Text("Hello, world!")
//                    Text("Hello, world!")
//                    Text("Hello, world!")
//                }
//                
//                
//                Text("Hello, world!")
//                
//            }
//            .navigationTitle("SwiftUI")
//            .navigationBarTitleDisplayMode(.inline)
//        }
//        
//    }
    /// Swift UI wants to know how to read & write to the name var
    @State private var selectedStudent = "Harry"
    let students = ["Jon","Jeff","Jimmy","Harry"]
    
    
    var body: some View {
        NavigationStack {
            Form {
                Picker("Select your student,", selection: $selectedStudent) {
                    ForEach(students, id: \.self) {
                        // id: \.self --> this is used to identify every view uniquely
                        // The strings themselves are their own unique identifier
                        // But if there were duplicate strings there would be issues
                        Text($0)
                    }
                }
            }
            .navigationTitle("Select a Student")
        }
        
    }
}

#Preview {
    ContentView()
}
