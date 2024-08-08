//
//  State.swift
//  tic-tac-toe
//
//  Created by Steven Rockarts on 2024-08-05.
//

import Foundation

enum State {
    case empty, x , o
    
    var description: String {
        switch self {
        case .empty: return ""
        case .x: return "X"
        case .o: return "O"
        }
    }
}
