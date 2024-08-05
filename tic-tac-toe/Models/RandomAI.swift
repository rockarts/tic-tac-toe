//
//  RandomAI.swift
//  tic-tac-toe
//
//  Created by Steven Rockarts on 2024-08-05.
//

import Foundation

class RandomAI {
    
    private let game: TicTacToe
    
    init(game: TicTacToe) {
        self.game = game
    }
    
    func makeMove() -> (Int, Int)? {
        let board = game.board
        var emptySpots:[(Int,Int)] = []
        for (rowIndex, _) in board.enumerated() {
            for (columnIndex, column) in board.enumerated() {
                print("Value at [\(rowIndex)][\(columnIndex)]: \(column)")
                if board[rowIndex][columnIndex] == .empty {
                    emptySpots.append((rowIndex, columnIndex))
                }
            }
        }
        
        if !emptySpots.isEmpty {
            let random = emptySpots.randomElement()!
            debugPrint("AI determined to move at \(random.0), \(random.1)")
            game.printBoard()
            return random
        }
        
        return nil
    }
}
