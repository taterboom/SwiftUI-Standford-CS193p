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
    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    let cornerRadius = 16.0
    func fontSize(for size: CGSize) -> CGFloat {
        min(size.width, size.height) * 0.7
    }
    
    var body: some View {
        GeometryReader { geometry in
            if !card.isMatched {
                Card(isFaceUp: card.isFaceUp) {
                    ZStack {
                        Pie(progress: 0.2)
                        Text(card.content)
                            .font(.system(size: fontSize(for: geometry.size))).foregroundColor(.orange)
                    }
                }
            }
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
