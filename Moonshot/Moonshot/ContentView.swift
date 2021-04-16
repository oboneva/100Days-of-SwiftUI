//
//  ContentView.swift
//  Moonshot
//
//  Created by Ognyanka Boneva on 16.04.21.
//

import SwiftUI

struct Address: Codable {
    let street: String
    let city: String
}

struct User: Codable {
    let name: String
    let address: Address
}

struct ContentView: View {
    var body: some View {
//        VStack {
//            GeometryReader { geo in
//                Image("Screenshot")
//                    .resizable()
//                    .aspectRatio(contentMode: .fit)
//                    .frame(width: geo.size.width)
//            }
//        }      
        
//        ScrollView(.vertical) {
//            VStack(spacing: 10) {
//                ForEach(0..<100) {
//                    Text("Item \($0)")
//                        .font(.title)
//                }
//            }
//            .frame(maxWidth: .infinity)
//        }
        
//        NavigationView {
//            List(0..<100) { row in
//                NavigationLink(destination: Text("Detail \(row)")) {
//                        Text("Row \(row)")
//                }
//            }
//            .navigationBarTitle("SwiftUI")
//        }
        
        Button("Decode JSON") {
            let input = """
            {
                "name": "Taylor Swift",
                "address": {
                    "street": "555, Taylor Swift Avenue",
                    "city": "Nashville"
                }
            }
            """

            let data = Data(input.utf8)
            let decoder = JSONDecoder()
            if let user = try? decoder.decode(User.self, from: data) {
                print(user.address.street)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
