//
//  Oval.swift
//  Set
//
//  Created by YesVladess on 14.05.2022.
//

import SwiftUI

struct Oval: Shape {

    let halfHeight: CGFloat
    let halfWidth: CGFloat

    func path(in rect: CGRect) -> Path {

        let cornerSize = CGSize(width: 55, height: 55)
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let drawingRect = CGRect(x: center.x - halfWidth, y: center.y - halfHeight,
                                 width: 2 * halfWidth,
                                 height: 2 * halfHeight)

        var p = Path()
        p.addRoundedRect(in: drawingRect, cornerSize: cornerSize)
        return p
    }
}

struct Oval_Previews: PreviewProvider {
    static var previews: some View {
        Oval(halfHeight: 50, halfWidth: 100)
    }
}
