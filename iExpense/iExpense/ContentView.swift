//
//  ContentView.swift
//  iExpense
//
//  Created by Ognyanka Boneva on 13.04.21.
//

import SwiftUI

//class User: ObservableObject {
//    @Published var firstName = "Bilbo"
//    @Published var lastName = "Baggins"
//}

struct SecondView: View {
    let name: String
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
//        Text("Hello \(name)")
        
        Button("Dismiss") {
            self.presentationMode.wrappedValue.dismiss()
        }
    }
}

struct User: Codable {
    var firstName: String
    var lastName: String
}

struct ContentView: View {
//    @ObservedObject private var user = User()
//    @State private var showingSheet = false
//    
//    var body: some View {
//        VStack {
//            Text("Your name is \(user.firstName) \(user.lastName).")
//
//            TextField("First name", text: $user.firstName)
//            TextField("Last name", text: $user.lastName)
//        }
//        Button("Show sheet") {
//            self.showingSheet.toggle()
//        }
//        .sheet(isPresented: $showingSheet) {
//            SecondView(name: "asd asd")
//        }
//    }
//    @State private var numbers = [Int]()
//    @State private var currentNumber = 1
//
//    var body: some View {
//        NavigationView {
//            VStack {
//                List {
//                    ForEach(numbers, id: \.self) {
//                        Text("\($0)")
//                    }
//                    .onDelete(perform: removeRows)
//                }
//                Button("Add Number") {
//                    self.numbers.append(self.currentNumber)
//                    self.currentNumber += 1
//                }
//            }
//            .navigationBarItems(leading: EditButton())
//        }
//    }
    
    @State private var tapCount = UserDefaults.standard.integer(forKey: "Tap")
    
    @State private var user = User(firstName: "Bilbo", lastName: "Baggins")

    var body: some View {
//        Button("Tap count: \(tapCount)") {
//            self.tapCount += 1
//            UserDefaults.standard.set(self.tapCount, forKey: "Tap")
//        }
        
        Button("Save User") {
            let encoder = JSONEncoder()
            
            if let data = try? encoder.encode(self.user) {
                UserDefaults.standard.set(data, forKey: "UserData")
            }
        }
    }
    
//    func removeRows(at offsets: IndexSet) {
//        numbers.remove(atOffsets: offsets)
//    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
