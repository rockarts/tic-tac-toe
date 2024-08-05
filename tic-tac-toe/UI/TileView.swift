//
//  TileView.swift
//  tic-tac-toe
//
//  Created by Steven Rockarts on 2024-08-04.
//

import SwiftUI

struct TileView: View {
    @Environment(\.appScheme) var appScheme
    
    let text: String
    
    
    var body: some View {
        Text("\(text)")
            .font(.system(size: 60))
            .frame(width: 100, height: 100)
            .foregroundColor(appScheme.text)
            .background(appScheme.background)
            .cornerRadius(10)
    }
}

#Preview {
    TileView(text: "X")
}
