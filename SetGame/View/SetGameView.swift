//
//  ContentView.swift
//  SetGame
//
//  Created by Student on 9/20/20.
//

import SwiftUI

struct SetGameView: View {
    @ObservedObject var game: SetGameController
    var body: some View {
        GeometryReader { geometry in
            self.body(for: geometry.size)
        }
    }
    func columns(for size: CGSize) -> [GridItem]{
        Array(repeating: GridItem(.flexible()), count: getDesiredColumnWidth(size: size))
    }
    
    //make this dynamic based on size
    func getDesiredColumnWidth(size: CGSize) -> Int {
        if(game.displayedCards.count > 40){
            return 6
        }else if (game.displayedCards.count > 26){
            return 5
        }else if(game.displayedCards.count > 12){
            return 4
        }else{
            return 3
        }
    }
    
    func body(for size: CGSize) -> some View {
           VStack {
                GeometryReader { geometry in
                    LazyVGrid(columns: columns(for: geometry.size)){
                        ForEach(game.displayedCards) { card in
                            CardView(card: card)
                                .onTapGesture {
                                    withAnimation{
                                        game.choose(card)
                                    }
                                }
                        }
                    }
                    .padding()
                    .foregroundColor(.blue)
                }
                HStack {
                    Spacer()
                    Button(action: {
                        game.dealMoreCards()
                    }) {
                        Text("Deal 3").foregroundColor(Color.black)
                    }
                   Spacer()
                   Text("Score: \(game.score)")
                   Spacer()
                }
               .font(Font.title)
                
                   
           }
       }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SetGameView(game: SetGameController())
    }
}
