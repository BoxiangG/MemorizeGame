//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Boxiang Guo on 2/5/22.
//
// MVVM - ViewModel

import SwiftUI


class EmojiMemoryGame: ObservableObject{
    static let electronics = ["⌚","🎙","🎛","📱","📺","📟","🎥","🕹"]
    //var sports = ["⛸","🥌","🎿","⛷","🏂","🤼‍♀️","🤸‍♀️","⛹️‍♂️","🏄‍♂️"]
    //var foods = ["🥖","🥨","🧀","🥚","🍳","🥩","🥓","🧇","🥞","🧈"]
    
    static func createMemoryGame() -> MemoryGame<String>{
        MemoryGame<String>(numberofPairsOfCards: 4) {pairindex in electronics[pairindex]}
    }
    
    @Published private var model: MemoryGame<String> = createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card>{
        return model.cards
    }
    
    // MARK: - Intents
    
    func choose(_ card: MemoryGame<String>.Card){
        model.choose(card)
    }
}
