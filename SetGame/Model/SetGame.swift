//
//  SetGame.swift
//  SetGame
//
//  Created by Student on 9/20/20.
//

import Foundation
struct SetGame{
    var cards: Array<Card>
    var cardsDisplayed: Array<Card>
    var score: Int
    
    struct Card: Identifiable {
        var id: Int
        let shape : SetShape
        let color : SetColor
        let shading: SetShading
        let number : Int
    }
    
    init() {
        cards = Array<Card>()
        cardsDisplayed = Array<Card>()
        score = 0
        var counter = 1
        
        for shape in SetShape.allCases {
            for color in SetColor.allCases{
                for shading in SetShading.allCases{
                    for number in 1...3{
                        var card = Card(id: counter, shape: shape, color: color, shading: shading, number: number)
                        cards.append(card)
                        counter += 1
                    }
                }
            }
        }
        cards.shuffle()
        for i in 0...2{
            cardsDisplayed.append(cards[i])
        }
       
    }
    
    mutating func reset (){
    }
    
    mutating func choose (){
    }
}

enum SetColor : CaseIterable {
    case red
    case purple
    case green
}

enum SetShading : CaseIterable {
    case solid
    case shaded
    case outlined
}

enum SetShape : CaseIterable {
    case diamond
    case squiggle
    case oval
}
