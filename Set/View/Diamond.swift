//
//  Diamond.swift
//  Set
//
//  Created by YesVladess on 14.05.2022.
//

import SwiftUI

struct Diamond: Shape {

    let halfHeight: CGFloat
    let halfWidth: CGFloat

    func path(in rect: CGRect) -> Path {
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let upperPoint = CGPoint(x: center.x, y: center.y - halfHeight)
        let leftPoint = CGPoint(x: center.x - halfWidth, y: center.y)
        let rightPoint = CGPoint(x: center.x + halfWidth, y: center.y)
        let bottomPoint = CGPoint(x: center.x, y: center.y + halfHeight)

        var p = Path()
        p.move(to: upperPoint)
        p.addLine(to: leftPoint)
        p.addLine(to: bottomPoint)
        p.addLine(to: rightPoint)
        p.addLine(to: upperPoint)
        return p
    }
    
}

struct Diamond_Previews: PreviewProvider {
    static var previews: some View {
        Diamond(halfHeight: 40, halfWidth: 70)
    }
}
