//
//  ContentView.swift
//  tic-tac-toe
//
//  Created by Steven Rockarts on 2024-08-01.
//

import SwiftUI
import GameKit
struct ContentView: View {
    @StateObject private var game = TicTacToe()
    
    var body: some View {
        VStack {
            Text("Current Player: \(game.currentPlayer)")
                .font(.title)
                .padding()
            
            Text("Winner: \(game.winner)")
                .font(.title)
                .padding()
            
            ForEach(0..<TicTacToe.boardSize) { row in
                HStack {
                    ForEach(0..<TicTacToe.boardSize) { col in
                        Button(action: {
                            print("\(row), \(col)")
                            game.turn(at: (col, row))
                        }) {
                            if game.board[row][col] != .empty {
                                Text("\(game.board[row][col]) ")
                                    .font(.system(size: 60))
                                    .frame(width: 100, height: 100)
                                    .background(Color.gray.opacity(0.2))
                                    .cornerRadius(10)
                            } else {
                                Text("")
                                    .font(.system(size: 60))
                                    .frame(width: 100, height: 100)
                                    .background(Color.gray.opacity(0.2))
                                    .cornerRadius(10)
                            }
                        }
                    }
                }
            }
            
            Button("Reset Game") {
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
