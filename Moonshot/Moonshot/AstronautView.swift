//
//  AstronautView.swift
//  Moonshot
//
//  Created by Ognyanka Boneva on 17.04.21.
//

import SwiftUI

struct AstronautView: View {
    let astronaut: Astronaut
    let missions: [Mission]
    
    init(astronaut: Astronaut, missions: [Mission]) {
        self.astronaut = astronaut
        
        self.missions = missions.filter { (mission) -> Bool in
            mission.crew.contains { (crewRole) -> Bool in
                crewRole.name == astronaut.id
            }
        }
    }
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView(.vertical) {
                VStack {
                    Image(self.astronaut.id)
                        .resizable()
                        .scaledToFit()
                        .frame(width: geometry.size.width)
                    
                    Text(self.astronaut.description)
                        .padding()
                        .layoutPriority(1)
                    
                    ForEach(self.missions) { mission in
                        HStack {
                            Image(mission.image)
                                .resizable()
                                .frame(width: 83, height: 60)
                                .clipShape(Capsule())
                                .overlay(Capsule().stroke(Color.primary, lineWidth: 1))
                         
                            VStack {
                                Text(mission.displayName)
                                    .font(.headline)
                                Text(mission.formattedLaunchDate)
                                    .foregroundColor(.secondary)
                            }
                            
                            Spacer()
                        }
                        .padding(.horizontal)
                    }
                }
            }
        }
        .navigationBarTitle(Text(astronaut.name), displayMode: .inline)
    }
}


struct AstronautView_Previews: PreviewProvider {
    static let astronauts: [Astronaut] = Bundle.main.decode(file: "astronauts.json")
    static let missions: [Mission] = Bundle.main.decode(file: "missions.json")
    
    static var previews: some View {
        AstronautView(astronaut: astronauts[0], missions: missions)
    }
}
