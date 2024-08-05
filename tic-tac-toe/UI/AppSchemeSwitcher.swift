//
//  AppSchemeHolder.swift
//  tic-tac-toe
//
//  Created by Steven Rockarts on 2024-08-04.
//

import Combine
import SwiftUI

class AppSchemeSwitcher: ObservableObject {
    let key = "SelectedAppSchemeName"
    
    @Published var current: AppScheme {
        didSet {
            UserDefaults.standard.set(current.name, forKey: key)
        }
    }
    
    init() {
        if let savedSchemeName = UserDefaults.standard.string(forKey: key),
           let savedScheme = colorSchemes.first(where: { $0.name == savedSchemeName }) {
            self.current = savedScheme
        } else {
            self.current = .cherryBlossom
        }
    }
    
    func schemeByName(_ name: String) -> AppScheme {
        colorSchemes.first { $0.name == name } ?? .cherryBlossom
    }
}
