//
//  ContentView.swift
//  tic-tac-toe
//
//  Created by Steven Rockarts on 2024-08-01.
//

import SwiftUI
import GameKit
struct ContentView: View {
    @Environment(\.appScheme) var appScheme
    @StateObject private var game = TicTacToe(scoreboard: Scoreboard())
    
    var body: some View {
        NavigationView {
            ZStack {
                appScheme
                    .backgroundImage
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .edgesIgnoringSafeArea(.all)
                ScrollView {
                    VStack {
                        ScoreboardView(scoreboard: game.scoreboard)
                        BoardView(game: game)
                        NavigationLink(destination: SettingsView()) {
                            HStack {
                                Image(systemName: "gearshape.fill")
                                Text("Settings")
                            }
                            .padding()
                            .background(appScheme.button)
                            .foregroundColor(appScheme.text)
                            .cornerRadius(10)
                        }
                    }.padding()
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
