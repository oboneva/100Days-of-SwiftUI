//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Ognyanka Boneva on 27.03.21.
//

import SwiftUI

struct ContentView: View {
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var score = 0
    @State private var tappedFlagIndex = 0
    
    @State private var animationDegrees = 0.0
    @State private var animationOpacity = 1.0 
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, .black]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 30) {
                VStack {
                    Text("Tap the flag of")
                        .foregroundColor(Color.white)
                    Text(countries[correctAnswer])
                        .font(.largeTitle)
                        .fontWeight(.black)
                        .foregroundColor(Color.white)
                }
                
                ForEach(0 ..< 3) { number in
                    Button(action: {
                        if self.flagTapped(number) {
                            withAnimation {
                                self.animationDegrees += 360
                                self.animationOpacity -= (number != correctAnswer ? 0.75 : 0.0)
                            }

                            askQuestion()
                        }        
                    }) {
                        FlagImage(country: countries[number])
                    }
                    .rotation3DEffect(
                        .degrees(number == correctAnswer ? animationDegrees : 0.0),
                        axis: (x: 0.0, y: 1.0, z: 0.0)
                    )
                    .opacity(number != correctAnswer ? animationOpacity : 1.0)
                }
                
                Text("Scores \(score)")
                    .foregroundColor(.white)
                
                Spacer()
            }
        }
        .alert(isPresented: $showingScore) {
            Alert(title: Text(scoreTitle), message: Text("Wrong! That’s the flag of \(countries[tappedFlagIndex])"), dismissButton: .default(Text("Continue")) {
                startAgain()
            })
        }
    }
    
    func flagTapped(_ number: Int) -> Bool {
        if number == correctAnswer {
            scoreTitle = "Correct"
            score += 1
        } else {
            scoreTitle = "Wrong"
            showingScore = true
        }
        tappedFlagIndex = number
        
        return number == correctAnswer
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    
    func startAgain() {
        showingScore = false
        score = 0
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
