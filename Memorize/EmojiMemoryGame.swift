//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Boxiang Guo on 2/5/22.
//
// MVVM - ViewModel

import SwiftUI


class EmojiMemoryGame: ObservableObject{

    init(){
        theme = EmojiMemoryGame.themes.randomElement()!
        theme.emojis.shuffle()
        model  = EmojiMemoryGame.createMemoryGame(theme: theme)
    }

    static let themes: Array<Theme> = [
        Theme(name: "Electronics", emojis: ["⌚","🎙","🎛","📱","📺","📟","🎥","🕹"], numberOfPairsOfCards: 5, color: .red),
        Theme(name: "Sports", emojis: ["⛸","🥌","🎿","⛷","🏂","🤼‍♀️","🤸‍♀️","⛹️‍♂️","🏄‍♂️"], numberOfPairsOfCards: 5, color: .yellow),
        Theme(name: "Foods", emojis: ["🥖","🥨","🧀","🥚","🍳","🥩","🥓","🧇","🥞","🧈"], numberOfPairsOfCards: 10, color: .gray),
        Theme(name: "Flags", emojis: ["🇸🇭","🇰🇳","🇱🇨","🇵🇲","🇻🇨","🇸🇾","🇨🇭","🇸🇷","🇸🇩","🇹🇼","🇹🇯","🇹🇿","🇹🇭","🇹🇱"], numberOfPairsOfCards: 14, color: .green),
        Theme(name: "Shapes", emojis: ["🟠","🟡","🟢","🔵","🟣","⚫️","⚪️","🟤","🔺","🔻","🔳","🔷","🔶","🔸","🔸"], numberOfPairsOfCards: 15, color: .blue),
        Theme(name: "Hearts", emojis: ["❤️","🧡","💛","💙","💔","🤎","🤍","💜","❤️‍🔥","❤️‍🩹","❣️","💞","💝","💘","💗","💓","💟"], numberOfPairsOfCards: 16, color: .orange)
    ]
        
        static func createMemoryGame(theme: Theme) -> MemoryGame<String>{
        MemoryGame<String>(numberofPairsOfCards: theme.numberOfPairsOfCards) {pairindex in theme.emojis[pairindex]
        }
    }
    
    @Published private var model: MemoryGame<String>
    
    private var theme: Theme
    var themeName: String{
        return theme.name
    }
    var score: Int{
        return model.score
    }
    var themeColor: Color{
        return theme.color
    }

    var cards: Array<MemoryGame<String>.Card>{
        return model.cards
    }
    
    // MARK: - Intents
    
    func choose(_ card: MemoryGame<String>.Card){
        model.choose(card)
    }
    
    func newGame(){
        theme = EmojiMemoryGame.themes.randomElement()!
        theme.emojis.shuffle()
        model = EmojiMemoryGame.createMemoryGame(theme: theme)
    }
}
