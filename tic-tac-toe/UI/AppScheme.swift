//
//  Theme.swift
//  tic-tac-toe
//
//  Created by Steven Rockarts on 2024-08-04.
//

import Foundation
import SwiftUI

struct AppScheme {
    let name: String
    let background: Color
    let text: Color
    let button: Color
    let backgroundImage: Image
}

extension AppScheme {
    static let cats = AppScheme(
        name: "Cats",
        background: Color("catsBoard").opacity(0.4),
        text: Color("catsText"),
        button: Color("catsButton"),
        backgroundImage: Image("cats")
    )
    
    static let cherryBlossom = AppScheme(
        name: "Cherry Blossom",
        background: Color("cherryblossomBoard").opacity(0.4),
        text: Color("cherryblossomText"),
        button: Color("cherryblossomButton"),
        backgroundImage: Image("cherryblossom")
    )
    
    static let dogs = AppScheme(
        name: "Dogs",
        background: Color("dogsBoard").opacity(0.4),
        text: Color("dogsText"),
        button: Color("dogsButton"),
        backgroundImage: Image("dogs")
    )
    
    static let jungle = AppScheme(
        name: "Jungle",
        background: Color("jungleBoard").opacity(0.4),
        text: Color("jungleText"),
        button: Color("jungleButton"),
        backgroundImage: Image("jungle")
    )
    
    static let mountains = AppScheme(
        name: "Mountains",
        background: Color("mountainsBoard").opacity(0.4),
        text: Color("mountainsText"),
        button: Color("mountainsButton"),
        backgroundImage: Image("mountains")
    )
    
    static let ocean = AppScheme(
        name: "Ocean",
        background: Color("oceanBoard").opacity(0.4),
        text: Color("oceanText"),
        button: Color("oceanButton"),
        backgroundImage: Image("ocean")
    )
    
    static let scifi = AppScheme(
        name: "SciFi",
        background: Color("scifiBoard").opacity(0.4),
        text: Color("scifiText"),
        button: Color("scifiButton"),
        backgroundImage: Image("scifi")
    )
    
    static let spooky = AppScheme(
        name: "Spooky",
        background: Color("spookyBoard").opacity(0.4),
        text: Color("spookyText"),
        button: Color("spookyButton"),
        backgroundImage: Image("spooky")
    )
}

let colorSchemes = [AppScheme.cats, AppScheme.cherryBlossom, AppScheme.dogs, AppScheme.jungle, AppScheme.mountains, AppScheme.ocean, AppScheme.scifi, AppScheme.spooky]


struct AppSchemeKey: EnvironmentKey {
    static let defaultValue: AppScheme = .cherryBlossom
}

extension EnvironmentValues {
    var appScheme: AppScheme {
        get { self[AppSchemeKey.self] }
        set { self[AppSchemeKey.self] = newValue }
    }
}
