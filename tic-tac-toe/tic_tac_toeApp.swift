//
//  tic_tac_toeApp.swift
//  tic-tac-toe
//
//  Created by Steven Rockarts on 2024-08-01.
//

import SwiftUI

@main
struct tic_tac_toeApp: App {
    @StateObject private var schemeHolder = AppSchemeSwitcher()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }.environment(\.appScheme, schemeHolder.current)
            .environmentObject(schemeHolder)
    }
}
