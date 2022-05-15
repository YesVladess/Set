//
//  CardView.swift
//  Set
//
//  Created by YesVladess on 13.05.2022.
//

import SwiftUI

struct CardView: View {

    typealias Card = SetGameViewModel.CardViewModel
    let card: Card

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
        switch card.shape {
        case .diamond:
            let halfHeight = size.height * 0.25 / 2
            let halfWidth = size.width * 0.4
            shape = AnyShape(Diamond(halfHeight: halfHeight,
                                     halfWidth: halfWidth))
        case .oval:
            shape = AnyShape(Oval(halfHeight: size.height * 0.1,
                                  halfWidth: size.width * 0.4))
        case .squiggle:
            shape = AnyShape(Squiggle(halfHeight: size.height * 0.1,
                                      halfWidth: size.width * 0.4))
        }
        return shape
    }

    private func getStyledShape(size: CGSize) -> AnyView {
        let cardShape = getCardShape(size: size)
        switch card.style {
        case .solid:
            return AnyView(cardShape.fill())
        case .stripped:
            return AnyView(cardShape.fill().opacity(0.3))
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
            switch card.quantity {
            case 1:
                coloredStyledShape
            case 2:
                coloredStyledShape
                coloredStyledShape
            case 3:
                coloredStyledShape
                coloredStyledShape
                coloredStyledShape
            default:
                EmptyView()
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
        CardView(card: SetGameViewModel.CardViewModel(shape: .squiggle,
                                                      style: .stripped,
                                                      color: .green,
                                                      quantity: 2)
        )
        .previewInterfaceOrientation(.portrait)
    }
}
