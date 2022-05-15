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
    var cards: [CardViewModel] {
        model.hand.map { card in
            CardViewModel(id: card.id,
                          shape: CardViewModel.CardShape(rawValue: card.firstFeature.rawValue)!,
                          style: CardViewModel.Style(rawValue: card.secondFeature.rawValue)!,
                          color: CardViewModel.CardColor(rawValue: card.thirdFeature.rawValue)!,
                          quantity: card.fourthFeature.rawValue + 1)
        }
    }

    init() {
        self.model = SetGame(startHand: 12)
    }

    // MARK: - Intent

    func choose(_ cardViewModel: CardViewModel) {
        // TODO: Should be only one card?
        let card = model.hand.filter{ $0.id == cardViewModel.id }.first!
        model.choose(card)
    }

    func newGame() {
        model = SetGame(startHand: 12)
    }

    func deal() {
        model.deal(cards: 3)
    }

    // MARK: - CardViewModel

    struct CardViewModel: Identifiable {

        var id: Int

        enum CardShape: Int, CaseIterable {
            case diamond
            case squiggle
            case oval
        }

        enum Style: Int, CaseIterable {
            case solid
            case stripped
            case open
        }

        enum CardColor: Int, CaseIterable {
            case red
            case green
            case blue
        }

        let shape: CardShape
        let style: Style
        let color: CardColor
        let quantity: Int

    }
    
}

