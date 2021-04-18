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
    let astronauts: [Astronaut] = Bundle.main.decode(file: "astronauts.json")
    let missions: [Mission] = Bundle.main.decode(file: "missions.json")
    @State private var showingCrew = false
    
    var body: some View {
        NavigationView {
            List(missions) { mission in
                NavigationLink(destination: MissionView(mission: mission, astronauts: astronauts, allMissions: missions)) {
                    Image(mission.image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 44, height: 44)
                    
                    VStack(alignment: .leading) {
                        Text(mission.displayName)
                            .font(.headline)
                        Text(self.showingCrew ? mission.crewNames : mission.formattedLaunchDate)
                    }
                }
            }
            .navigationBarTitle("Moonshot")
            .navigationBarItems(trailing: 
                                    Button(self.showingCrew ? "Launch" : "Crew") {
                                        self.showingCrew.toggle()
                                    }
            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
