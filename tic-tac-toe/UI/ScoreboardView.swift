//
//  Scoreboard.swift
//  tic-tac-toe
//
//  Created by Steven Rockarts on 2024-08-03.
//

import SwiftUI

struct ScoreboardView: View {
    @Environment(\.appScheme) var appScheme
    @ObservedObject var scoreboard: Scoreboard
    var body: some View {
        VStack {
            Text("Score").font(.title2).padding(.top)
            HStack {
                VStack {
                    Text("X")
                    Text("\(scoreboard.xWins)")
                }
                
                VStack {
                    Text("O")
                    Text("\(scoreboard.oWins)")
                }
                
                VStack {
                    Text("Tie")
                    Text("\(scoreboard.ties)")
                }
            }
            Button("Reset Scores") {
                scoreboard.resetScores()
            }.buttonStyle(.borderedProminent)
                .tint(appScheme.button)
                .padding([.leading, .trailing, .bottom])
        }.bold()
            .background(appScheme.background)
            .cornerRadius(15)
            .foregroundColor(appScheme.text)
    }
}

#Preview {
    ScoreboardView(scoreboard: Scoreboard())
}
