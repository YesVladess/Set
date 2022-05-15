//
//  SetGame.swift
//  Set
//
//  Created by YesVladess on 13.05.2022.
//

import Foundation
import SwiftUI

struct SetGame {

    private let avaliableRangeOfShapeNumber = 1...3

    private(set) var cards: [Card]
    private(set) var score: Int = 0

    struct Card: Equatable, Identifiable {

        static func == (lhs: SetGame.Card, rhs: SetGame.Card) -> Bool {
            lhs.shape == rhs.shape && lhs.numberOfShapes == rhs.numberOfShapes && lhs.style == rhs.style
        }

        var id: Int {
            return numberOfShapes + shape.rawValue * 10 + style.rawValue * 100 + color.rawValue * 1000
        }

        enum Shape: Int, CaseIterable {
            case diamond
            case squiggle
            case oval
        }

        enum Style: Int, CaseIterable {
            case solid
            case stripped
            case open
        }

        enum Color: Int, CaseIterable {
            case red
            case green
            case blue
        }

        let numberOfShapes: Int
        let shape: Shape
        let style: Style
        let color: Color

    }

    init() {
        cards = []
        for shape in Card.Shape.allCases {
            for number in avaliableRangeOfShapeNumber {
                for style in Card.Style.allCases {
                    for color in Card.Color.allCases {
                        cards.append(Card(numberOfShapes: number, shape: shape, style: style, color: color))
                    }
                }
            }
        }
        //cards.shuffle()
        print("Game Initialized with \(cards.count) cards")
    }

    mutating func choose(_ card: Card) {

    }

}
