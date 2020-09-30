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
        SetGame()
    }
    
    var cards: Array<SetGame.Card> {
        game.cards
    }
    
    var cardsDisplayed: Array<SetGame.Card> {
        game.cardsDisplayed
    }
    
    var score: Int{
        game.score
    }

    func select(card: SetGame.Card) {
        game.choose()
    }

//    func dealCards() {
//        game?.dealCards()
//    }
    
    func createSetGame() {
        game = SetGame()
    }
    
    func resetSetGame() {
        game = SetGame()
    }
}

struct SetGameController_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
