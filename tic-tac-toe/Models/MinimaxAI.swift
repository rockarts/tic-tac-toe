//
//  MinimaxAI.swift
//  tic-tac-toe
//
//  Created by Steven Rockarts on 2024-08-06.
//

import Foundation

class MinimaxAI {
    private let game: TicTacToe
    
    init(game: TicTacToe) {
        self.game = game
    }
    
    func bestMove() -> (Int, Int)? {
        var bestScore = -Int.max
        var move: (Int, Int)?
        for i in 0..<TicTacToe.boardSize {
            for j in 0..<TicTacToe.boardSize {
                if game.board[i][j] == .empty {
                    game.board[i][j] = game.currentPlayer
                    let score = minimax(depth: 0, isMaximizing: false)
                    game.board[i][j] = .empty
                    if score > bestScore {
                        bestScore = score
                        move = (i, j)
                    }
                }
            }
        }
        return move
    }

    private func minimax(depth: Int, isMaximizing: Bool) -> Int {
        let winner = checkWinnerForMinimax()
        if winner != .none || game.isFull() {
            return scoreForWinner(winner, depth: depth)
        }

        if isMaximizing {
            var bestScore = -Int.max
            for i in 0..<TicTacToe.boardSize {
                for j in 0..<TicTacToe.boardSize {
                    if game.board[i][j] == .empty {
                        game.board[i][j] = game.currentPlayer
                        let score = minimax(depth: depth + 1, isMaximizing: false)
                        game.board[i][j] = .empty
                        bestScore = max(score, bestScore)
                    }
                }
            }
            return bestScore
        } else {
            var bestScore = Int.max
            for i in 0..<TicTacToe.boardSize {
                for j in 0..<TicTacToe.boardSize {
                    if game.board[i][j] == .empty {
                        game.board[i][j] = game.currentPlayer == .x ? .o : .x
                        let score = minimax(depth: depth + 1, isMaximizing: true)
                        game.board[i][j] = .empty
                        bestScore = min(score, bestScore)
                    }
                }
            }
            return bestScore
        }
    }

    private func checkWinnerForMinimax() -> Winner {
        let flatGrid = game.board.flatMap { $0 }
        
        for line in TicTacToe.lines {
            let lineStates = line.map { flatGrid[$0] }
            if lineStates.allSatisfy({ $0 == .x }) {
                return .x
            } else if lineStates.allSatisfy({ $0 == .o }) {
                return .o
            }
        }
        
        return .none
    }

    private func scoreForWinner(_ winner: Winner, depth: Int) -> Int {
        switch winner {
        case .x:
            return game.currentPlayer == .x ? 10 - depth : depth - 10
        case .o:
            return game.currentPlayer == .o ? 10 - depth : depth - 10
        case .none:
            return 0
        }
    }
}
