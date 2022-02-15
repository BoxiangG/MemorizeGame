//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Boxiang Guo on 1/13/22.
//

import SwiftUI

@main
struct MemorizeApp: App {
    let game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
