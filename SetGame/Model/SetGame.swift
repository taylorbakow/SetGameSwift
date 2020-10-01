//
//  SetGame.swift
//  SetGame
//
//  Created by Student on 9/20/20.
//

import Foundation
struct SetGame{
    var cards: Array<Card>
    var score: Int
    var cardsDisplayed = 12
    var displayedCards: Array<Card>{
           return Array(cards.filter{ card in !(card.isMatched ?? false) || card.isSelected }[0..<cardsDisplayed])
       }

    
    struct Card: Identifiable {
        var id: Int
        let shape : SetShape
        let color : SetColor
        let shading: SetShading
        let number : Int
        var isMatched = false
        var isSelected = false
    }
    
    init() {
        cards = Array<Card>()
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
    }
    
    private func isMatchingSet(cardSet: [Card]) -> Bool {
           var numbers = Set<Int>()
           var shapes = Set<SetShape>()
           var shadings = Set<SetShading>()
           var colors = Set<SetColor>()

           for card in cardSet {
               numbers.insert(card.number)
               shapes.insert(card.shape)
               shadings.insert(card.shading)
               colors.insert(card.color)
           }

           if numbers.count == 2 || shapes.count == 2 || shadings.count == 2 || colors.count == 2 {
               return false
           }

           return true
   }
    
    private mutating func showMatch(cardIndices: IndexSet) {
          for i in cardIndices {
              cards[i].isSelected = false
              cards[i].isMatched = true
          }
      }
      
      private mutating func removeCards(cardIndices: IndexSet) {
          for i in cardIndices {
              cards[i].isSelected = false
              cards[i].isMatched = false
          }
      }
    
    mutating func dealMoreCards() {
        cardsDisplayed += 3
        score -= 9
    }
    
    mutating func choose(card: Card) {
            var previousSelectedIndices = IndexSet()
            var currentSelectedIndex = Int()
            for (index, c) in cards.enumerated() {
                if(c.isSelected){
                    previousSelectedIndices.insert(index)
                }
                if(c.id == card.id){
                    currentSelectedIndex = index
                }
            }
            var allSelectedIndices = previousSelectedIndices
            allSelectedIndices.insert(currentSelectedIndex)

            if allSelectedIndices.count == 3 {
                if previousSelectedIndices.count == 3 {
                    if isMatchingSet(cardSet: previousSelectedIndices.map { cards[$0] }) {
                        showMatch(cardIndices: previousSelectedIndices)
                    } else {
                        removeCards(cardIndices: previousSelectedIndices)
                        cards[currentSelectedIndex].isSelected = true
                    }
                } else if isMatchingSet(cardSet: allSelectedIndices.map { cards[$0] }) {
                    allSelectedIndices.forEach({ cardIndex in cards[cardIndex].isMatched = true })
                    cards[currentSelectedIndex].isSelected = true
                    score += 3
                } else {
                    allSelectedIndices.forEach({ cardIndex in
                        cards[cardIndex].isMatched = false
                        cards[cardIndex].isSelected = true
                    })
                    score -= 1
                }
            } else if previousSelectedIndices.count == 3 {
                if isMatchingSet(cardSet: previousSelectedIndices.map { cards[$0] }) {
                    showMatch(cardIndices: previousSelectedIndices)
                } else {
                    removeCards(cardIndices: previousSelectedIndices)
                }
                cards[currentSelectedIndex].isSelected = !cards[currentSelectedIndex].isSelected
            } else {
                cards[currentSelectedIndex].isSelected = !cards[currentSelectedIndex].isSelected
            }
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
