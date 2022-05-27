//
//  CardView.swift
//  Set
//
//  Created by YesVladess on 13.05.2022.
//

import SwiftUI

struct CardView: View {

    let card: CardViewModel

    var body: some View {
        GeometryReader(content: { geometry in
            ZStack {
                let shape = RoundedRectangle(cornerRadius: DrawingConstants.cornerRadius)
                shape.fill().foregroundColor(.white)
                switch card.state {
                case .chosen:
                    shape.stroke(.green, lineWidth: geometry.size.width * 0.05)
                case .stable:
                    shape.stroke(.black, lineWidth: geometry.size.width * 0.05)
                case .mismatched:
                    shape.stroke(.red, lineWidth: geometry.size.width * 0.05)
                }
                getShapes(size: geometry.size)
            }
        })
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

    @ViewBuilder
    private func getColoredStyledShape(size: CGSize) -> some View {
        let styledShape = getCardShape(size: size)
        switch card.color {
        case .green:
            styledShape.foregroundColor(.green)
        case .red:
            styledShape.foregroundColor(.red)
        case .blue:
            styledShape.foregroundColor(.blue)
        }
    }

    @ViewBuilder
    private func getCardShape(size: CGSize) -> some View {
        let shape: AnyShape = {
            switch card.shape {
            case .diamond:
                let halfHeight = size.height * 0.25 / 2
                let halfWidth = size.width * 0.4
                return AnyShape(Diamond(halfHeight: halfHeight,
                                       halfWidth: halfWidth))
            case .oval:
                return AnyShape(Oval(halfHeight: size.height * 0.1,
                                    halfWidth: size.width * 0.4))
            case .squiggle:
                return AnyShape(Squiggle(halfHeight: size.height * 0.1,
                                        halfWidth: size.width * 0.4))
            }
        }()

        switch card.style {
        case .solid:
            AnyView(shape.fill())
        case .stripped:
            AnyView(shape.fill().opacity(0.3))
        case .open:
            AnyView(shape.stroke().fill())
        }
    }

    private struct DrawingConstants {
        static let cornerRadius: CGFloat = 10
        static let lineWidth: CGFloat = 3
    }
    
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: CardViewModel(id: 3,
                                     state: .mismatched,
                                     shape: .oval,
                                     style: .stripped,
                                     color: .blue,
                                     quantity: 1)
        ).frame(width: 200, height: 400, alignment: .center)
        .previewInterfaceOrientation(.portrait)
    }
}
