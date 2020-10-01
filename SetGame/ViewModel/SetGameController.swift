//
//  SetGameController.swift
//  SetGame
//
//  Created by Student on 9/20/20.
//

import SwiftUI

class SetGameController: ObservableObject {
    @Published private var game = createGame()

    
    static func createGame() -> SetGame {
        return SetGame()
    }
    
    var cards: Array<SetGame.Card> {
        game.cards
    }
    
    var displayedCards: Array<SetGame.Card> {
        game.displayedCards
    }
    
    var cardsDisplayed: Int{
        game.cardsDisplayed
    }
    
    var score: Int{
        game.score
    }

    func choose(_ card: SetGame.Card) {
        game.choose(card: card)
    }

    func dealMoreCards() {
        game.dealMoreCards()
    }
}

struct SetGameController_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
