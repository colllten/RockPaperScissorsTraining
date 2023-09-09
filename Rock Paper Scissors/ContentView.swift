//
//  ContentView.swift
//  Rock Paper Scissors
//
//  Created by Colten Glover on 9/5/23.
//

import SwiftUI
import CoreData

struct ContentView: View {
    var choices = ["Rock", "Paper", "Scissors"]
    @State private var computerChoice = Int.random(in: 0...2)
    @State private var userWin = Bool.random()
    @State private var scoreIsPresented = false
    @State private var userScore = 0
    @State private var scoreTitle = ""
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(colors: [.white, .gray], startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                
                VStack {
                    Text("Computer chooses...")
                        .font(.largeTitle)
                    Text(choices[computerChoice])
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(.bottom)
                    Text("You must...")
                        .font(.largeTitle)
                    Text(userWin ? "Win" : "Lose")
                        .foregroundColor(userWin ? .green : .red)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    Spacer()
                    ForEach(choices, id: \.self) { choice in
                        Button(choice) {
                            evaluateAnswer(userChoice: choice)
                        }
                        .padding(.vertical)
                        .font(.title)
                        .frame(maxWidth: .infinity)
                        .background(.white)
                        .clipShape(Capsule())
                        .padding(.horizontal)
                        .padding(.vertical)
                        .alert(scoreTitle, isPresented: $scoreIsPresented) {
                            Button("OK") {
                                askQuestion()
                            }
                        }
                    }
                    Spacer()
                }
            }
        }
    }
    func evaluateAnswer(userChoice: String) {
        if userWin {
            if userChoice == "Rock" && choices[computerChoice] == "Scissors"
            || userChoice == "Paper" && choices[computerChoice] == "Rock"
            || userChoice == "Scissors" && choices[computerChoice] == "Paper" {
                scoreTitle = "Correct!"
            } else {
                scoreTitle = "Wrong!"
            }
        } else {
            if userChoice == "Rock" && choices[computerChoice] == "Paper"
            || userChoice == "Paper" && choices[computerChoice] == "Scissors"
                || userChoice == "Scissors" && choices[computerChoice] == "Rock" {
                scoreTitle = "Correct!"
            } else {
                scoreTitle = "Wrong!"
            }
        }
        scoreIsPresented = true
    }
    
    func askQuestion() {
        computerChoice = Int.random(in: 0...2)
        userWin = Bool.random()
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
