//
//  BoardView.swift
//  tic-tac-toe
//
//  Created by Steven Rockarts on 2024-08-03.
//

import SwiftUI

struct BoardView: View {
    @ObservedObject var game: TicTacToe
    var body: some View {
        
        ForEach(0..<TicTacToe.boardSize, id: \.self) { row in
            HStack {
                ForEach(0..<TicTacToe.boardSize, id: \.self) { col in
                    Button(action: {
                        print("\(row), \(col)")
                        game.turn(at: (col, row))
                    }) {
                        if game.board[row][col] != .empty {
                            Text("\(game.board[row][col]) ")
                                .font(.system(size: 60))
                                .frame(width: 100, height: 100)
                                .foregroundColor(Color.white)
                                .background(Color.pink.opacity(0.4))
                                .cornerRadius(10)
                        } else {
                            Text("")
                                .font(.system(size: 60))
                                .frame(width: 100, height: 100)
                                .foregroundColor(Color.white)
                                .background(Color.pink.opacity(0.4))
                                .cornerRadius(10)
                        }
                    }
                }
            }
        }
        TurnView(game: game)
    }
}

#Preview {
    BoardView(game: TicTacToe())
}
