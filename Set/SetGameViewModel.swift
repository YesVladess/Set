//
//  SetGameViewModel.swift
//  Set
//
//  Created by YesVladess on 13.05.2022.
//

import SwiftUI

class SetGameViewModel: ObservableObject {

    @Published private var model: SetGame
    var score: Int { model.score }
    var cards: [SetGame.Card] { model.cards }

    init() {
        self.model = SetGame()
    }

    // MARK: - Intent

    func choose(_ card: SetGame.Card) {
        model.choose(card)
    }

    func newGame() {
        model = SetGame()
    }
}

