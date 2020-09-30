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
    
    private func columns(for size: CGSize) -> [GridItem]{
        Array(repeating: GridItem(.flexible()), count: Int(size.width / desiredCardWidth))
    }
    
    private func body(for size: CGSize) -> some View {
           VStack {
                GeometryReader { geometry in
                    LazyVGrid(columns: columns(for: geometry.size)){
                        ForEach(game.cardsDisplayed) { card in
                            CardView(card: card)
                                .onTapGesture {
                                    game.select(card: card)
                                }
                        }
                    }
                    .foregroundColor(.blue)
                }
                HStack {
                   Spacer()
                   Text("Score: \(game.score)")
                   Spacer()
                }
               .font(Font.title)
                
                   
           }
       }
    
    private let desiredCardWidth: CGFloat = 100
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SetGameView(game: SetGameController())
    }
}
