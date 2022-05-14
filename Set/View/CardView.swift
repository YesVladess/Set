//
//  CardView.swift
//  Set
//
//  Created by YesVladess on 13.05.2022.
//

import SwiftUI

struct CardView: View {

    let card: SetGame.Card

    private var numberOfShapes: CGFloat {
        CGFloat(card.number.rawValue)
    }

    var body: some View {
        GeometryReader(content: { geometry in
            ZStack {
                let shape = RoundedRectangle(cornerRadius: DrawingConstants.cornerRadius)
                shape.fill().foregroundColor(.white)
                shape.stroke(lineWidth: 1)
                getShapes(size: geometry.size)
            }
        })
    }

    private func getCardShape(size: CGSize) -> AnyShape {
        var shape: AnyShape
        switch card.shapeType {
        case .diamond:
            let halfHeight = size.height * 0.25 / 2
            let halfWidth = size.width * 0.8 / 2
            shape = AnyShape(Diamond(halfHeight: halfHeight,
                                     halfWidth: halfWidth))
        case .oval:
            shape = AnyShape(Rectangle())
        case .squiggle:
            shape = AnyShape(Ellipse())
        }
        return shape
    }

    private func getStyledShape(size: CGSize) -> AnyView {
        let cardShape = getCardShape(size: size)
        switch card.style {
        case .solid:
            return AnyView(cardShape.fill())
        case .stripped:
            return AnyView(cardShape.stroke(lineWidth: DrawingConstants.lineWidth))
        case .open:
            return AnyView(cardShape.stroke().fill())
        }
    }

    private func getColoredStyledShape(size: CGSize) -> some View {
        let styledShape = getStyledShape(size: size)
        switch card.color {
        case .green:
            return styledShape.foregroundColor(.green)
        case .red:
            return styledShape.foregroundColor(.red)
        case .blue:
            return styledShape.foregroundColor(.blue)
        }
    }

    @ViewBuilder
    private func getShapes(size: CGSize) -> some View {
        let coloredStyledShape = getColoredStyledShape(size: size)
        VStack(alignment: .center, spacing: 5) {
            switch card.number {
            case .one:
                coloredStyledShape
            case .two:
                coloredStyledShape
                coloredStyledShape
            case .three:
                coloredStyledShape
                coloredStyledShape
                coloredStyledShape
            }
        }.padding(5)
    }

    private struct DrawingConstants {
        static let cornerRadius: CGFloat = 10
        static let lineWidth: CGFloat = 3
    }
    
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: SetGame.Card(number: .one,
                                    shapeType: .diamond,
                                    style: .stripped,
                                    color: .blue)
        )
        .previewInterfaceOrientation(.portrait)
    }
}
