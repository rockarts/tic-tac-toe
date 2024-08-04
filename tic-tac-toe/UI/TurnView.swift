//
//  TurnView.swift
//  tic-tac-toe
//
//  Created by Steven Rockarts on 2024-08-04.
//

import SwiftUI

struct TurnView: View {
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
                .tint(Color(red: 0.44, green: 0.54, blue: 0.76))
        }.bold()
            .background(Color.pink.opacity(0.4))
            .cornerRadius(15)
            .foregroundColor(.white)
    }
}

#Preview {
    TurnView(game: TicTacToe())
}
