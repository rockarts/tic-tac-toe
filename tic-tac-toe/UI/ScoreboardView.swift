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
                .tint(Color(red: 0.44, green: 0.54, blue: 0.76))
                .padding([.leading, .trailing, .bottom])
        }.bold()
            .background(Color.pink.opacity(0.4))
            .cornerRadius(15)
            .foregroundColor(.white)
    }
}

#Preview {
    ScoreboardView(scoreboard: Scoreboard())
}
