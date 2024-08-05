//
//  TurnView.swift
//  tic-tac-toe
//
//  Created by Steven Rockarts on 2024-08-04.
//

import SwiftUI

struct TurnView: View {
    @Environment(\.appScheme) var appScheme
    @ObservedObject var game: TicTacToe
    
    var body: some View {
        VStack {
            Text("Current Player: \(game.currentPlayer)")
                .font(.title3).padding([.leading, .top, .trailing])
            Text("Winner: \(game.winner)")
                .font(.title3)
            Button("Reset Game") {
                game.resetGame()
            }.buttonStyle(.borderedProminent).padding(.bottom)
                .tint(appScheme.button)
        }.bold()
            .background(appScheme.background)
            .cornerRadius(15)
            .foregroundColor(appScheme.text)
    }
}

#Preview {
    TurnView(game: TicTacToe())
}
