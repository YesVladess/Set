//
//  SetApp.swift
//  Set
//
//  Created by YesVladess on 13.05.2022.
//

import SwiftUI

@main
struct SetApp: App {

    var body: some Scene {
        WindowGroup {
            let game = SetGameViewModel()
            SetGameView(game: game)
        }
    }
    
}
