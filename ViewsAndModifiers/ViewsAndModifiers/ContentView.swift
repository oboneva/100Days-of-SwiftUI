//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Ognyanka Boneva on 1.04.21.
//

import SwiftUI

struct ContentView: View {
    let motto1 = Text("Draco dormiens")
    let motto2 = Text("nunquam titillandus")
    var motto1Bold: some View { motto1.bold() }
    
    var body: some View {
//        Text("Hello, world!")
//            .frame(maxWidth: .infinity, maxHeight: .infinity)
//            .background(Color.red)
//            .ignoresSafeArea(edges: .all)
        
//        Button("Hello word") {
//            print(type(of: self.body))
//        }
//        .background(Color.red)
//        .frame(width: 200, height: 200)
        
//        Text("Hello World")
//            .padding()
//            .background(Color.red)
//            .padding()
//            .background(Color.blue)
//            .padding()
//            .background(Color.green)
//            .padding()
//            .background(Color.yellow)
        
//        TupleView {
//            Text("Hello World")
//                .padding()
//                .background(Color.red)
//                .padding()
//                .background(Color.blue)
//                .padding()
//                .background(Color.green)
//                .padding()
//                .background(Color.yellow)
//            
//            Text("Hello World")
//                .padding()
//                .background(Color.red)
//                .padding()
//                .background(Color.blue)
//                .padding()
//                .background(Color.green)
//                .padding()
//                .background(Color.yellow)
        
//            VStack {
//                Text("Gryffindor")
//                    .font(.largeTitle)
//                Text("Hufflepuff")
//                Text("Ravenclaw")
//                Text("Slytherin")
//            }
//            .font(.title)
        
//        VStack {
//            Text("Gryffindor")
//                .blur(radius: 0)
//            Text("Hufflepuff")
//            Text("Ravenclaw")
//            Text("Slytherin")
//        }
//        .blur(radius: 5)
        
        VStack {
            motto1Bold
            motto2
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
