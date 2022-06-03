//
//  Pie.swift
//  Memorize
//
//  Created by 薛勇 on 2022/5/29.
//

import SwiftUI

struct Pie: Shape {
    
    var progress: Double
    
    var animatableData: Double {
        get { progress }
        set { progress = newValue }
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let radius = min(rect.width, rect.height) / 2
        let center = CGPoint(x: rect.midX, y: rect.midY)
        path.move(to: center)
        path.addLine(to: CGPoint(x: rect.midX, y: rect.midY - radius))
        path.addArc(center: center, radius: radius, startAngle: Angle(degrees: 0 - 90), endAngle: Angle(degrees: Double(360 * progress) - 90), clockwise: true)
        return path
    }
}
