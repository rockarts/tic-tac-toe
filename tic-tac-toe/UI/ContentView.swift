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
        ScrollView {
            VStack {
                ScoreboardView(scoreboard: game.scoreboard)
                Text("Current Player: \(game.currentPlayer)")
                    .font(.title)
                    .padding()
                
                Text("Winner: \(game.winner)")
                    .font(.title)
                    .padding()
                
                BoardView(game: game)
            }.padding()
        }
        
    }
}

#Preview {
    ContentView()
}
