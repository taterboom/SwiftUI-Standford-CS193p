//
//  Card.swift
//  Memorize
//
//  Created by 薛勇 on 2022/5/29.
//

import SwiftUI

struct Card<ContentView>: View, Animatable where ContentView: View {
    let cornerRadius = 16.0
    var content: () -> ContentView
    var rotation: Double = 0
    
    init(isFaceUp: Bool, content: @escaping () -> ContentView) {
        self.content = content
        self.isFaceUp = isFaceUp
    }
    var isFaceUp: Bool {
        get { rotation > 90 }
        set {
            rotation = newValue ? 180 : 0
        }
    }
    var animatableData: Double {
        get { rotation }
        set { rotation = newValue }
    }
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: cornerRadius).fill(.orange)
                .opacity(isFaceUp ? 0 : 1)
            Group {
                bg()
                content()
            }.opacity(isFaceUp ? 1 : 0)
        }
            .rotation3DEffect(.degrees(rotation), axis: (0, 1, 0))
            
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
