//
//  SetGame.swift
//  SetGame
//
//  Created by Taylor Bakow on 9/20/20.
//

import Foundation
struct SetGame{
    var cards: Array<Card>
    var score: Int
    var cardsDisplayed = 12
    
    //Getter will grab the available cards based on cardsDisplayed which is adjusted by the user.
    var displayedCards: Array<Card>{
        var displayedCards = Array<Card>()
        var counter = 0
        for card in cards{
            if card.isMatched != true || (card.isMatched == true && card.isSelected == true){
                displayedCards.append(card)
                counter += 1
                if counter >= cardsDisplayed{
                    break
                }
            }
        }
        return displayedCards
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
        for shape in SetShape.allCases {
            for color in SetColor.allCases{
                for shading in SetShading.allCases{
                    for number in 1...3{
                        let card = Card(id: cards.count, shape: shape, color: color, shading: shading, number: number)
                        cards.append(card)
                    }
                }
            }
        }
        cards.shuffle()
    }
    
    mutating func evaluateSet(cardIndices: IndexSet) -> Bool {
            var selectedCards = [Card]()
            for index in cardIndices {
                selectedCards.append(cards[index])
            }
            var numbers = Set<Int>()
            var shapes = Set<SetShape>()
            var shadings = Set<SetShading>()
            var colors = Set<SetColor>()

            for card in selectedCards {
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
    
    mutating func removeMatchedCards(cardIndices: IndexSet) {
          for i in cardIndices {
              cards[i].isSelected = false
              cards[i].isMatched = true
          }
      }
    
    mutating func deselectCards(cardIndices: IndexSet) {
        for i in cardIndices {
            cards[i].isSelected = false
            cards[i].isMatched = false
        }
    }
    
    mutating func setCardsToMatched(cardIndices: IndexSet){
        for i in cardIndices {
            cards[i].isMatched = true
        }
    }
    
    mutating func setCardsToSelected(cardIndices: IndexSet){
        for i in cardIndices {
            cards[i].isMatched = false
            cards[i].isSelected = true
        }
    }
    
    mutating func removeExtraCards(){
        if(cardsDisplayed > 12){
            cardsDisplayed -= 3
        }
    }

    
    mutating func dealMoreCards() {
        cardsDisplayed += 3
        score -= 1
    }
    
    mutating func choose(card: Card) {
            var selectedIndices = IndexSet()
            var currentSelectedIndex = Int()
            for (index, c) in cards.enumerated() {
                if(c.isSelected){
                    selectedIndices.insert(index)
                }
                if(c.id == card.id){
                    currentSelectedIndex = index
                }
            }
            var allSelectedIndices = selectedIndices
            allSelectedIndices.insert(currentSelectedIndex)
            if allSelectedIndices.count == 3 {
                if selectedIndices.count == 3 {
                    if evaluateSet(cardIndices: selectedIndices) {
                        removeMatchedCards(cardIndices: selectedIndices)
                        removeExtraCards()
                    } else {
                        deselectCards(cardIndices: selectedIndices)
                    }
                } else if evaluateSet(cardIndices: allSelectedIndices) {
                    setCardsToMatched(cardIndices: allSelectedIndices)
                    cards[currentSelectedIndex].isSelected = true
                    score += 5
                } else {
                    setCardsToSelected(cardIndices: allSelectedIndices)
                }
            } else if selectedIndices.count == 3 {
                if evaluateSet(cardIndices: selectedIndices) {
                    removeMatchedCards(cardIndices: selectedIndices)
                    removeExtraCards()
                }else{
                    deselectCards(cardIndices: selectedIndices)
                }
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
