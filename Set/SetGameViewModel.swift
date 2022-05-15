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
        model.cards.map { card in
            CardViewModel(shape: CardViewModel.CardShape(rawValue: card.firstFeature.rawValue)!,
                          style: CardViewModel.Style(rawValue: card.secondFeature.rawValue)!,
                          color: CardViewModel.CardColor(rawValue: card.thirdFeature.rawValue)!,
                          quantity: card.fourthFeature.rawValue + 1
            )
        }
    }

    init() {
        self.model = SetGame()
    }

    // MARK: - Intent

    func choose(_ card: CardViewModel) {
        //model.choose(card)
    }

    func newGame() {
        model = SetGame()
    }

    // MARK: - CardViewModel

    struct CardViewModel: Identifiable {

        var id: Int {
            return shape.rawValue + style.rawValue * 10 + color.rawValue * 100 + quantity * 1000
        }

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

