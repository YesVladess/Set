//
//  Squiggle.swift
//  Set
//
//  Created by YesVladess on 15.05.2022.
//

import SwiftUI

struct Squiggle: Shape {

    let halfHeight: CGFloat
    let halfWidth: CGFloat

    func path(in rect: CGRect) -> Path {

        let center = CGPoint(x: rect.midX, y: rect.midY)
        let drawingRect = CGRect(x: center.x - halfWidth, y: center.y - halfHeight,
                                 width: 2 * halfWidth,
                                 height: 2 * halfHeight)
        let rectWidth = drawingRect.size.width
        let rectHeight = drawingRect.size.height
        var point, cp1, cp2: CGPoint

        var p = Path()
        // Choose the start point
        point = CGPoint(x: drawingRect.origin.x + rectWidth * 0.05,
                        y: drawingRect.origin.y + rectHeight * 0.40)
        p.move(to: point)

        // Draw 1st curve
        point = CGPoint(x: drawingRect.origin.x + rectWidth * 0.35,
                        y: drawingRect.origin.y + rectHeight * 0.25)
        cp1 = CGPoint(x: drawingRect.origin.x + rectWidth * 0.03,
                      y: drawingRect.origin.y + rectHeight * 0.15)
        cp2 = CGPoint(x: drawingRect.origin.x + rectWidth * 0.18,
                      y: drawingRect.origin.y + rectHeight * 0.10)
        p.addCurve(to: point, control1: cp1, control2: cp2)

        // Draw 2nd curve
        point = CGPoint(x: drawingRect.origin.x + rectWidth * 0.75,
                        y: drawingRect.origin.y + rectHeight * 0.30)
        cp1 = CGPoint(x: drawingRect.origin.x + rectWidth * 0.40,
                      y: drawingRect.origin.y + rectHeight * 0.30)
        cp2 = CGPoint(x: drawingRect.origin.x + rectWidth * 0.60,
                      y: drawingRect.origin.y + rectHeight * 0.45)
        p.addCurve(to: point, control1: cp1, control2: cp2)

        // Draw 3rd curve
        point = CGPoint(x: drawingRect.origin.x + rectWidth * 0.97,
                        y: drawingRect.origin.y + rectHeight * 0.35)
        cp1 = CGPoint(x: drawingRect.origin.x + rectWidth * 0.87,
                      y: drawingRect.origin.y + rectHeight * 0.15)
        cp2 = CGPoint(x: drawingRect.origin.x + rectWidth * 0.98,
                      y: drawingRect.origin.y + rectHeight * 0.00)
        p.addCurve(to: point, control1: cp1, control2: cp2)

        // Draw 4th curve
        point = CGPoint(x: drawingRect.origin.x + rectWidth * 0.45,
                        y: drawingRect.origin.y + rectHeight * 0.85)
        cp1 = CGPoint(x: drawingRect.origin.x + rectWidth * 0.95,
                      y: drawingRect.origin.y + rectHeight * 1.10)
        cp2 = CGPoint(x: drawingRect.origin.x + rectWidth * 0.50,
                      y: drawingRect.origin.y + rectHeight * 0.95)
        p.addCurve(to: point, control1: cp1, control2: cp2)

        // Draw 5th curve
        point = CGPoint(x: drawingRect.origin.x + rectWidth * 0.25,
                        y: drawingRect.origin.y + rectHeight * 0.85)
        cp1 = CGPoint(x: drawingRect.origin.x + rectWidth * 0.40,
                      y: drawingRect.origin.y + rectHeight * 0.80)
        cp2 = CGPoint(x: drawingRect.origin.x + rectWidth * 0.35,
                      y: drawingRect.origin.y + rectHeight * 0.70)
        p.addCurve(to: point, control1: cp1, control2: cp2)

        // Draw 6th curve to the start point
        point = CGPoint(x: drawingRect.origin.x + rectWidth * 0.05,
                        y: drawingRect.origin.y + rectHeight * 0.40)
        cp1 = CGPoint(x: drawingRect.origin.x + rectWidth * 0.2,
                      y: drawingRect.origin.y + rectHeight * 0.95)
        cp2 = CGPoint(x: drawingRect.origin.x + rectWidth * 0.01,
                      y: drawingRect.origin.y + rectHeight * 0.75)
        p.addCurve(to: point, control1: cp1, control2: cp2)

        return p
    }
}

struct Squiggle_Previews: PreviewProvider {
    static var previews: some View {
        Squiggle(halfHeight: 50, halfWidth: 100)
    }
}
