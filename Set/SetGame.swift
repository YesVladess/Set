//
//  SetGame.swift
//  Set
//
//  Created by YesVladess on 13.05.2022.
//

import Foundation
import SwiftUI

struct SetGame {

    private(set) var cards: [Card]
    private(set) var score: Int = 0

    struct Card: Equatable {

        enum Feature: Int, CaseIterable {
            case firstPossibilitie
            case secondPossibilitie
            case thirdPossibilitie
        }

        let firstFeature: Feature
        let secondFeature: Feature
        let thirdFeature: Feature
        let fourthFeature: Feature

        static func == (lhs: SetGame.Card, rhs: SetGame.Card) -> Bool {
            lhs.firstFeature == rhs.firstFeature &&
            lhs.secondFeature == rhs.secondFeature &&
            lhs.thirdFeature == rhs.thirdFeature &&
            lhs.fourthFeature == rhs.fourthFeature
        }

    }

    init() {
        cards = []
        for firstFeature in Card.Feature.allCases {
            for secondFeature in Card.Feature.allCases {
                for thirdFeature in Card.Feature.allCases {
                    for fourthFeature in Card.Feature.allCases {
                        cards.append(Card(firstFeature: firstFeature,
                                          secondFeature: secondFeature,
                                          thirdFeature: thirdFeature,
                                          fourthFeature: fourthFeature)
                        )
                    }
                }
            }
        }
        cards.shuffle()
        print("Game Initialized with \(cards.count) cards")
    }

    mutating func choose(_ card: Card) {

    }

}
