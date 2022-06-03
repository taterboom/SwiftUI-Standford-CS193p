//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by 薛勇 on 2022/5/25.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        Grid(viewModel.cards) {
            card in
            CardView(card: card).onTapGesture {
                    viewModel.choose(card: card)
            }
                .padding(4)
        }
        Button("reset") {
            withAnimation() {
                viewModel.reset()
            }
        }
    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    let cornerRadius = 16.0
    func fontSize(for size: CGSize) -> CGFloat {
        min(size.width, size.height) * 0.7
    }
    @State var ani = false
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                if card.isFaceUp || !card.isMatched {
                    Card(isFaceUp: card.isFaceUp) {
                        ZStack {
                            Pie(progress: card.isFaceUp ? 1 : 0)
                            Text(card.content)
                                .font(.system(size: fontSize(for: geometry.size))).foregroundColor(.orange)
                        }
                    }
                        .transition(.scale)
                }
            }
            .animation(.easeInOut, value: card.isFaceUp)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var viewModel: EmojiMemoryGame {
        let viewModel = EmojiMemoryGame()
        viewModel.choose(card: viewModel.cards[0])
        return viewModel
    }
    static var previews: some View {
        EmojiMemoryGameView(viewModel: ContentView_Previews.viewModel)
    }
}
