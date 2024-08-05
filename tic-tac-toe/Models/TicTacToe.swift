//
//  TicTacToe.swift
//  tic-tac-toe
//
//  Created by Steven Rockarts on 2024-08-01.
//

import Foundation

enum State {
    case empty, x , o
    
    var description: String {
        switch self {
        case .empty: return ""
        case .x: return "X"
        case .o: return "O"
        }
    }
}

enum Winner: Int {
    case none, x, o
    
    var description: String {
        switch self {
        case .none: return ""
        case .x: return "X"
        case .o: return "O"
        }
    }
}

class TicTacToe: ObservableObject {
    static let boardSize = 3
    @Published var board: [[State]] = Array(repeating: Array(repeating: .empty, count: boardSize), count: boardSize)
    @Published var currentPlayer: State = .x
    @Published var winner: Winner = .none
    @Published var isGameOver: Bool = false
    @Published var scoreboard: Scoreboard
    @Published var isAIThinking: Bool = false
    
    init(scoreboard: Scoreboard = Scoreboard()) {
        self.scoreboard = scoreboard
    }
    
    private static let lines: [[Int]] = {
        let size = boardSize
        var lines: [[Int]] = []
        
        // Rows
        for i in 0..<size {
            lines.append((0..<size).map { j -> Int in i * size + j })
        }
        
        // Columns
        for i in 0..<size {
            lines.append((0..<size).map { j -> Int in j * size + i })
        }
        
        // Diagonals
        lines.append((0..<size).map { i -> Int in i * size + i })
        lines.append((0..<size).map { i -> Int in i * size + (size - 1 - i) })
        
        return lines
    }()
    
    func isEmpty() -> Bool {
        board.flatMap { $0 }.allSatisfy { $0 == .empty }
    }
    
    func isFull() -> Bool {
        board.flatMap { $0 }.allSatisfy { $0 != .empty }
    }
    
    func printBoard() {
        for row in board {
            let rowString = row.map { cellState in
                switch cellState {
                case .empty: return "."
                case .x: return "X"
                case .o: return "O"
                }
            }.joined(separator: " ")
            print(rowString)
        }
    }
    
    func turn(at position: (Int, Int)) {
        guard !isGameOver && !isAIThinking && currentPlayer == .x else { return }
        
        var successful = false
        if currentPlayer == .o {
            if let move = RandomAI(game: self).makeMove() {
                successful = makeMove(at: move)
            }
        } else {
            successful = makeMove(at: position)
        }
        
        if successful {
            togglePlayer()
            checkGameOver()
            makeAIMove()
        }
    }
    
    func makeAIMove() {
        guard currentPlayer == .o && !isGameOver && !isAIThinking else { return }
        
        isAIThinking = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [weak self] in
            guard let self = self else { return }
            if let move = RandomAI(game: self).makeMove() {
                _ = self.makeMove(at: (move.1, move.0))
                self.togglePlayer()
                self.checkGameOver()
            }
            self.isAIThinking = false
        }
    }
    
    func makeMove(at position: (Int, Int)) -> Bool {
        //Check that the move is in bounds and that the space is available.
        guard board[position.0][position.1] == .empty else {
            print("Illegal move")
            return false
        }
        
        board[position.0][position.1] = currentPlayer
        return true
    }
    
    func togglePlayer() {
        currentPlayer = currentPlayer == .x ? .o : .x
    }
    
    func checkWinner() {
        let flatGrid = board.flatMap { $0 }
        
        for line in TicTacToe.lines {
            let lineStates = line.map { flatGrid[$0] }
            print(lineStates)
            if lineStates.allSatisfy({ $0 == .x }) {
                winner = .x
                break
            } else if lineStates.allSatisfy({ $0 == .o }) {
                winner = .o
                break
            } else {
                winner = .none
            }
        }
    }
    
    private func checkGameOver() {
        checkWinner()
        if winner != .none || isFull() {
            isGameOver = true
            updateScores()
        }
    }
    
    private func updateScores() {
        if winner == .none && isFull() {
            scoreboard.incrementScore(for: .none)
        } else {
            scoreboard.incrementScore(for: winner)
        }
    }
    
    func resetGame() {
        board = Array(repeating: Array(repeating: .empty, count: TicTacToe.boardSize), count: TicTacToe.boardSize)
        currentPlayer = .x
        winner = .none
        isGameOver = false
    }
}
