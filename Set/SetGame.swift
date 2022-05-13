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

    struct Card: Equatable, Identifiable {

        static func == (lhs: SetGame.Card, rhs: SetGame.Card) -> Bool {
            lhs.shapeType == rhs.shapeType && lhs.number == rhs.number && lhs.style == rhs.style
        }

        var id: Int {
            return number.rawValue + shapeType.rawValue * 10 + style.rawValue * 100 + color.rawValue * 1000
        }

        enum ShapeType: Int, CaseIterable {
            case diamond
            case squiggle
            case oval
        }

        enum NumberOfShapes: Int, CaseIterable {
            case one = 1
            case two = 2
            case three = 3
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

        let number: NumberOfShapes
        let shapeType: ShapeType
        let style: Style
        let color: Color
    }

    init() {
        cards = []
        for shape in Card.ShapeType.allCases {
            for number in Card.NumberOfShapes.allCases {
                for style in Card.Style.allCases {
                    for color in Card.Color.allCases {
                        cards.append(Card(number: number, shapeType: shape, style: style, color: color))
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
