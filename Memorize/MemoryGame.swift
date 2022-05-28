//
//  MemoryGame.swift
//  Memorize
//
//  Created by 薛勇 on 2022/5/27.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    var cards: Array<Card>
    var candidateCardIndex: Int?
    
    mutating func choose(card: Card) {
        print("you choose \(card)")
        if let index = cards.firstIndex(where: { $0.id == card.id }) {
            guard !cards[index].isFaceUp && !cards[index].isFaceUp else { return }
            cards[index].isFaceUp = true
            if let candidateCardIndex = candidateCardIndex {
                self.candidateCardIndex = nil
                if (cards[candidateCardIndex].content == card.content) {
                    cards[candidateCardIndex].isMatched = true
                    cards[candidateCardIndex].isFaceUp = false
                    cards[index].isMatched = true
                    cards[index].isFaceUp = false
                } else {
                    for index in cards.indices {
                        cards[index].isFaceUp = false
                    }
                }
            } else {
                candidateCardIndex = index
            }
        }
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
        var isFaceUp: Bool = false
        var isMatched: Bool  = false
        var content: CardContent
    }
}
