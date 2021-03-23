//
//  ContentView.swift
//  WeSplit
//
//  Created by Ognyanka Boneva on 23.03.21.
//

import SwiftUI

struct ContentView: View {
    @State private var name = ""
    @State private var selectedStudent = 0
    let students = ["Harry", "Ron", "Hermione"]
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Enter your name: ", text: $name)
                Text("Your name is \(name)")
                
                VStack {
                    Picker("Select your student", selection: $selectedStudent) {
                        ForEach(0..<students.count) {
                            Text(self.students[$0])
                        }
                    }
                }
            }
            .navigationBarTitle("SwiftUI")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
