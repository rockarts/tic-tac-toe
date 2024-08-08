//
//  Winner.swift
//  tic-tac-toe
//
//  Created by Steven Rockarts on 2024-08-05.
//

import Foundation

enum Winner: Int {
    case none, x, o
    
    var description: String {
        switch self {
        case .none: return ""
        case .x: return "X"
        case .o: return "O"
        }
    }
}
