//
//  ContentView.swift
//  Shared
//
//  Created by Ognyanka Boneva on 28.04.21.
//

import SwiftUI

struct ContentView: View {
//    @State private var results = [Result]()
//    
//    var body: some View {
//        List(results, id: \.trackId) { item in
//            VStack(alignment: .leading) {
//                Text(item.trackName)
//                    .font(.headline)
//                Text(item.collectionName)
//            }
//        }
//        .onAppear(perform: loadData)
//    }
    
    @State private var username = ""
    @State private var email = ""
    
    var disableForm: Bool {
        username.count < 5 || email.count < 5
    }
    
    var body: some View {
        Form {
            Section {
                TextField("Username", text: $username)
                TextField("Email", text: $email)
            }
            
            Section {
                Button("Create account") {
                    print("Creating account...")
                }
            }
            .disabled(disableForm)
        }
    }
    
//    func loadData() {
//        guard let url = URL(string: "https://itunes.apple.com/search?term=taylor+swift&entity=song") else {
//            print("Invalid URL")
//            return
//        }
//        
//        let request = URLRequest(url: url)
//        
//        URLSession.shared.dataTask(with: request) { data, response, error in
//            if let data = data, let decodedResponse = try? JSONDecoder().decode(Response.self, from: data) {
//                DispatchQueue.main.async {
//                    self.results = decodedResponse.results
//                }
//                return
//            }
//            
//            print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
//            
//        }.resume()
//    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
