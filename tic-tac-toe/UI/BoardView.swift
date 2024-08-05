//
//  BoardView.swift
//  tic-tac-toe
//
//  Created by Steven Rockarts on 2024-08-03.
//

import SwiftUI

struct BoardView: View {
    @Environment(\.appScheme) var appScheme
    @ObservedObject var game: TicTacToe

    var body: some View {
        
        ForEach(0..<TicTacToe.boardSize, id: \.self) { col in
            HStack {
                ForEach(0..<TicTacToe.boardSize, id: \.self) { row in
                    Button(action: {
                        game.turn(at: (row, col))
                    }) {
                        game.board[row][col] != .empty ? TileView(text: "\(game.board[row][col])") : TileView(text: "")
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
