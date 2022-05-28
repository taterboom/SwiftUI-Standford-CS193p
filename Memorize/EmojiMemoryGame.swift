//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by 薛勇 on 2022/5/27.
//

import Foundation

class EmojiMemoryGame: ObservableObject {
    static func createModel() -> MemoryGame<String> {
        let emojis = ["🥶", "👻", "🤡"]
        return MemoryGame(numberOfPairsOfCards: emojis.count, cardContentFactory: { index in
            emojis[index]
        })
    }
    
    @Published private(set) var model: MemoryGame<String> = EmojiMemoryGame.createModel()
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
    
}
