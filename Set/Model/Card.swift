//
//  Card.swift
//  Set
//
//  Created by YesVladess on 16.05.2022.
//

import Foundation

struct Card: Identifiable {

    enum Feature: Int, CaseIterable {
        case firstPossibilitie
        case secondPossibilitie
        case thirdPossibilitie
    }

    var id: Int {
        return firstFeature.rawValue + secondFeature.rawValue * 10 + thirdFeature.rawValue * 100 + fourthFeature.rawValue * 1000
    }

    let firstFeature: Feature
    let secondFeature: Feature
    let thirdFeature: Feature
    let fourthFeature: Feature
}
