//
//  SetGame.swift
//  Set
//
//  Created by YesVladess on 13.05.2022.
//

import Foundation
import SwiftUI

struct SetGame {

    private(set) var deck: [Card]
    private(set) var hand: [Card]
    private(set) var selectedCards: [Card]
    private(set) var score: Int = 0

    // MARK: Initialization

    init(startHand: Int) {
        self.deck = []
        self.hand = []
        self.selectedCards = []
        for firstFeature in Card.Feature.allCases {
            for secondFeature in Card.Feature.allCases {
                for thirdFeature in Card.Feature.allCases {
                    for fourthFeature in Card.Feature.allCases {
                        deck.append(Card(firstFeature: firstFeature,
                                          secondFeature: secondFeature,
                                          thirdFeature: thirdFeature,
                                          fourthFeature: fourthFeature)
                        )
                    }
                }
            }
        }
        //deck.shuffle()
        deal(cards: startHand)
        print("Game Initialized with \(deck.count) cards. \(hand.count) cards are in play")
    }

    // MARK: Public methods

    mutating func choose(_ card: Card) {
        // TODO: What if it contains it already?
        selectedCards.append(card)
        if selectedCards.count == 3 {
            if cardsAreSet(first: selectedCards[0], second: selectedCards[1], third: selectedCards[2]) {
                for card in selectedCards {
                    let cardId = card.id
                    hand = hand.filter { $0.id != cardId }
                }
            }
            selectedCards = []
        }
    }

    mutating func deal(cards: Int) {
        guard deck.count >= cards else { return }
        let cardsToDeal = Array(deck[0..<cards])
        hand.append(contentsOf: cardsToDeal)
        deck = Array(deck.dropFirst(cards))
    }

    // MARK: Private methods

    private func cardsAreSet(first: Card, second: Card, third: Card) -> Bool {
        return featuresFormsSet(first: first.firstFeature, second: second.firstFeature, third: third.firstFeature) &&
        featuresFormsSet(first: first.secondFeature, second: second.secondFeature, third: third.secondFeature) &&
        featuresFormsSet(first: first.thirdFeature, second: second.thirdFeature, third: third.thirdFeature) &&
        featuresFormsSet(first: first.fourthFeature, second: second.fourthFeature, third: third.fourthFeature)
    }

    private func featuresFormsSet(first: Card.Feature, second: Card.Feature, third: Card.Feature) -> Bool {
        return (first == second && second == third) ||
        (first != second && second != third && first != third)
    }

}
