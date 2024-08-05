//
//  RandomAI.swift
//  tic-tac-toe
//
//  Created by Steven Rockarts on 2024-08-05.
//

import Foundation

class RandomAI {
    
    func makeMove(board: [[State]]) -> (Int, Int)? {
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
            dump(emptySpots)
            debugPrint("AI determined to move at \(random.0), \(random.1)")
            return random
        }
        
        return nil
    }
}
