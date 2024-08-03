//
//  Scoreboard.swift
//  tic-tac-toe
//
//  Created by Steven Rockarts on 2024-08-03.
//

import SwiftUI

struct ScoreboardView: View {
    @ObservedObject var scoreboard: Scoreboard
    var body: some View {
        VStack {
            Text("Score: X \(scoreboard.xWins) wins")
            Text("Score: O \(scoreboard.oWins) wins")
            Text("Score: \(scoreboard.ties) ties")
            Button("Reset Scores") {
                scoreboard.resetScores()
            }
            .padding()
        }
    }
}

