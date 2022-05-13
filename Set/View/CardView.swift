//
//  CardView.swift
//  Set
//
//  Created by YesVladess on 13.05.2022.
//

import SwiftUI

struct CardView: View {

    let card: SetGame.Card

    var body: some View {
        GeometryReader(content: { geometry in
            ZStack {
                let shape = RoundedRectangle(cornerRadius: DrawingConstants.cornerRadius)
                shape.fill().foregroundColor(.white)
                shape.stroke(lineWidth: 1)
                getShapes()
            }
        })
    }

    private func getCardShape() -> AnyShape {
        var shape: AnyShape
        switch card.shapeType {
        case .diamond:
            shape = AnyShape(Circle())
        case .oval:
            shape = AnyShape(Rectangle())
        case .squiggle:
            shape = AnyShape(Ellipse())
        }
        return shape
    }

    private func getStyledShape() -> AnyView {
        let cardShape = getCardShape()
        switch card.style {
        case .solid:
            return AnyView(cardShape.fill())
        case .stripped:
            return AnyView(cardShape.stroke(lineWidth: DrawingConstants.lineWidth))
        case .open:
            return AnyView(cardShape.stroke().fill())
        }
    }

    private func getColoredStyledShape() -> some View {
        let styledShape = getStyledShape()
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
    private func getShapes() -> some View {
        let coloredStyledShape = getColoredStyledShape()
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
        CardView(card: SetGame.Card(number: .three,
                                    shapeType: .squiggle,
                                    style: .stripped,
                                    color: .blue)
        )
        .previewInterfaceOrientation(.portrait)
    }
}
