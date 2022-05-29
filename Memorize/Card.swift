//
//  Card.swift
//  Memorize
//
//  Created by 薛勇 on 2022/5/29.
//

import SwiftUI

struct Card<ContentView>: View where ContentView: View {
    let cornerRadius = 16.0
    var isFaceUp: Bool
    var content: () -> ContentView
    var body: some View {
        ZStack {
            if isFaceUp {
                bg()
                content()
            } else {
                RoundedRectangle(cornerRadius: cornerRadius).fill(.orange)
            }
        }
    }
    @ViewBuilder func bg() -> some View {
        RoundedRectangle(cornerRadius: cornerRadius).fill(.white)
        RoundedRectangle(cornerRadius: cornerRadius).stroke(.orange)
    }
}

struct Cardify: ViewModifier{
    var isFaceUp: Bool

    func body(content: Content) -> some View{
        Card(isFaceUp: isFaceUp) {
            content
        }
    }
}

extension View {
    func cardify(isFaceUp: Bool) -> some View {
        modifier(Cardify(isFaceUp: isFaceUp))
    }
}
