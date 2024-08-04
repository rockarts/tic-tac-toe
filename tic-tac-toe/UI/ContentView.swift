//
//  ContentView.swift
//  tic-tac-toe
//
//  Created by Steven Rockarts on 2024-08-01.
//

import SwiftUI
import GameKit
struct ContentView: View {
    @StateObject private var game = TicTacToe(scoreboard: Scoreboard())
    
    var body: some View {
        ZStack {
            Image("cherryblossom")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .edgesIgnoringSafeArea(.all)
            ScrollView {
                VStack {
                    ScoreboardView(scoreboard: game.scoreboard)
                    BoardView(game: game)
                }.padding()
            }
        }
    }
}

#Preview {
    ContentView()
}
