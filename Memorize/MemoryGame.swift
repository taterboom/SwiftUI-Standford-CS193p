//
//  MemoryGame.swift
//  Memorize
//
//  Created by 薛勇 on 2022/5/27.
//

import Foundation

struct MemoryGame<CardContent> {
    var cards: Array<Card>
    
    mutating func choose(card: Card) {
        print("you choose \(card)")
        let index = index(of: card)
        print(index)
        if index > -1 {
            cards[index].isFaceUp = !cards[index].isFaceUp
        }
    }
    
    func index(of card: Card) -> Int {
        for index in 0..<cards.count {
            if (cards[index].id == card.id) {
                return index
            }
        }
        return -1
    }
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = Array<Card>()
        for index in 0..<numberOfPairsOfCards {
            cards.append(Card(id: index * 2, content: cardContentFactory(index)))
            cards.append(Card(id: index * 2 + 1, content: cardContentFactory(index)))
        }
    }
    
    struct Card: Identifiable {
        var id: Int
        var isFaceUp: Bool = true
        var isMatched: Bool  = false
        var content: CardContent
    }
}
