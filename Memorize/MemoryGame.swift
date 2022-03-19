//
//  MemoryGame.swift
//  Memorize
//
//  Created by Boxiang Guo on 2/5/22.
//
// MVVM - Model

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable{
    private(set) var cards: Array<Card>
    private var indexOfTheOneAndOnlyFaceUpCard: Int?
    private(set) var score: Int
    
    mutating func choose(_ card: Card){
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id}),
           !cards[chosenIndex].isFaceUp,
            !cards[chosenIndex].isMatched
        {
            if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard{
                //chosing second card
                if cards[chosenIndex].content == cards[potentialMatchIndex].content{
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                    score += 2
                } else {
                    // if not matched reduce score
                    if cards[chosenIndex].isAlreadySeen == true{
                        score -= 1
                    }
                    if cards[potentialMatchIndex].isAlreadySeen == true{
                        score -= 1
                    }
                }
                //set selected two cards as seen
                cards[potentialMatchIndex].isAlreadySeen = true
                cards[chosenIndex].isAlreadySeen = true
                
                indexOfTheOneAndOnlyFaceUpCard = nil
            }else{
                for index in cards.indices{
                    cards[index].isFaceUp = false
                }
                indexOfTheOneAndOnlyFaceUpCard = chosenIndex
            }
            cards[chosenIndex].isFaceUp.toggle()
        }
    }
    
    func index(of card: Card) -> Int? {
        for index in 0..<cards.count{
            if cards[index].id == card.id{
                return index
            }
        }
        return nil
    }
    
    init(numberofPairsOfCards: Int, createCardContent: (Int)-> CardContent){
        cards = Array<Card>()
        for pairIndex in 0..<numberofPairsOfCards {
            let content: CardContent = createCardContent(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2+1))
        }
        cards.shuffle()
        score = 0
    }
    
    struct Card: Identifiable{
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var isAlreadySeen: Bool = false
        var content: CardContent
        var id: Int
    }
}

