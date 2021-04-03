//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Ognyanka Boneva on 3.04.21.
//

import SwiftUI

struct ContentView: View {
    
    enum GameMove: String, Identifiable, CaseIterable {
        var id: GameMove {
            self
        }
        
        case Rock, Paper, Scissors
        
        var beats: GameMove {
            switch self {
            case .Paper:
                return .Rock
            case .Rock:
                return .Scissors
            case .Scissors:
                return .Paper
            }
        }
    }
    
    @State private var appCurentChoice = Int.random(in: 0...GameMove.allCases.count - 1)
    @State private var shouldWin = Bool.random()
    @State private var score = 0
    @State private var totalMoves = 0
    @State private var startAgainAlertShown = false
    
    var body: some View {
        VStack {
            Spacer()
            
            Text("Your score is \(score)")
            Text("The app chose \(GameMove.allCases[appCurentChoice].rawValue)")
            Text("Try to \(shouldWin ? "Win" : "Lose")")
            
            Spacer()
            
            HStack {
                ForEach(GameMove.allCases, id: \.self) { move in 
                    Button(move.rawValue) {
                        onMoveTap(move)
                    }
                }
                .padding()
                .frame(width: 100, height: 100)
                .border(Color.blue)
            }
            
            Spacer()
        }
        .alert(isPresented: $startAgainAlertShown) {
            Alert(title: Text("You scored \(score)"),
                  message: Text("Try again ??"),
                  dismissButton: Alert.Button.default(Text("Ok")) { 
                startAgain()
            })
        }
    }
    
    func onMoveTap(_ move: GameMove) {
        totalMoves += 1
        
        let appChoice = GameMove.allCases[appCurentChoice]
        if shouldWin, move.beats == appChoice {
            score += 1
        } else if !shouldWin, move.beats != appChoice {
            score += 1
        } else {
            score -= 1
        }
        
        if totalMoves == 9 {
            startAgainAlertShown = true
        } else {
            appCurentChoice = Int.random(in: 0...GameMove.allCases.count - 1)
            shouldWin = Bool.random()
        }
    }
    
    func startAgain() {
        appCurentChoice = Int.random(in: 0...GameMove.allCases.count - 1)
        shouldWin = Bool.random()
        totalMoves = 0
        score = 0
        startAgainAlertShown = false
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
