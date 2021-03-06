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
        Theme(name: "Electronics", emojis: ["β","π","π","π±","πΊ","π","π₯","πΉ"], numberOfPairsOfCards: 5, color: .red),
        Theme(name: "Sports", emojis: ["βΈ","π₯","πΏ","β·","π","π€ΌββοΈ","π€ΈββοΈ","βΉοΈββοΈ","πββοΈ"], numberOfPairsOfCards: 5, color: .yellow),
        Theme(name: "Foods", emojis: ["π₯","π₯¨","π§","π₯","π³","π₯©","π₯","π§","π₯","π§"], numberOfPairsOfCards: 10, color: .gray),
        Theme(name: "Flags", emojis: ["πΈπ­","π°π³","π±π¨","π΅π²","π»π¨","πΈπΎ","π¨π­","πΈπ·","πΈπ©","πΉπΌ","πΉπ―","πΉπΏ","πΉπ­","πΉπ±"], numberOfPairsOfCards: 14, color: .green),
        Theme(name: "Shapes", emojis: ["π ","π‘","π’","π΅","π£","β«οΈ","βͺοΈ","π€","πΊ","π»","π³","π·","πΆ","πΈ","πΈ"], numberOfPairsOfCards: 15, color: .blue),
        Theme(name: "Hearts", emojis: ["β€οΈ","π§‘","π","π","π","π€","π€","π","β€οΈβπ₯","β€οΈβπ©Ή","β£οΈ","π","π","π","π","π","π"], numberOfPairsOfCards: 16, color: .orange)
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
