//
//  CardViewModel.swift
//  Set
//
//  Created by YesVladess on 16.05.2022.
//

import Foundation

struct CardViewModel: Identifiable {

    enum CardState {
        case chosen
        case stable
        case mismatched
    }
    var id: Int
    var state: CardState

    let shape: CardShape
    let style: Style
    let color: CardColor
    let quantity: Int

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

}
