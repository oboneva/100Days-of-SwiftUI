//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Ognyanka Boneva on 27.03.21.
//

import SwiftUI

struct ContentView: View {
    @State private var showingAlert = false
    
    var body: some View {
//        VStack(alignment: .leading, spacing: 20) {
//            HStack(spacing: 20) {
//                Text("Hello, world!")
//                Text("Hello, world!")
//                Text("Hello, world!")
//            }
//            
//            HStack(spacing: 20) {
//                Text("Hello, world!")
//                Text("Hello, world!")
//                Text("Hello, world!")
//            }
//            
//            HStack(spacing: 20) {
//                Text("Hello, world!")
//                Text("Hello, world!")
//                Text("Hello, world!")
//            }
//        }
        
//        ZStack {
////            Color.red.frame(width: 200, height: 200)
//            Color.red.edgesIgnoringSafeArea(.bottom)
//            Text("Hello, world!")
//                .background(Color.white)
//        }
        
//        ZStack {
//            LinearGradient(gradient: Gradient(colors: [.white, .black]), startPoint: .top, endPoint: .bottom)
            
//            RadialGradient(gradient: Gradient(colors: [.blue, .white]), center: .center, startRadius: 20, endRadius: 200)
            
//            AngularGradient(gradient: Gradient(colors: [.red, .yellow, .green, .blue, .purple, .red]), center: .center)
//        }.ignoresSafeArea(edges: .bottom)
        
//        Button("Tap me") {
//            print("Button was tapped!!")
//        }
        
//        Button(action: {
//            print("Button was tapped!!")
//        }) {
//            HStack(spacing: 10) {
//                Image(systemName: "pencil")
//                Text("Edit")
//            }
//        }
        
        Button("Tap") {
            self.showingAlert = true
        }
        .alert(isPresented: $showingAlert) { 
            Alert(title: Text("Alert"), message: Text("alerty alert"), dismissButton: .default(Text("Ok")))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
