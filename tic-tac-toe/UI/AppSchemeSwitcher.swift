//
//  AppSchemeHolder.swift
//  tic-tac-toe
//
//  Created by Steven Rockarts on 2024-08-04.
//
import Combine

class AppSchemeSwitcher: ObservableObject {
    @Published var current: AppScheme

    init(scheme: AppScheme = .jungle) {
        self.current = scheme
    }
}
