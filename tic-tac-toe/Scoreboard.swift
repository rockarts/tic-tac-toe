//
//  Scoreboard.swift
//  tic-tac-toe
//
//  Created by Steven Rockarts on 2024-08-02.
//

import Combine

class Scoreboard: ObservableObject {
    @Published var xWins: Int = 0
    @Published var oWins: Int = 0
    @Published var ties: Int = 0
    
    func incrementScore(for winner: Winner) {
        switch winner {
        case .x:
            xWins += 1
        case .o:
            oWins += 1
        case .none:
            ties += 1
        }
    }
    
    func resetScores() {
        xWins = 0
        oWins = 0
        ties = 0
    }
}
