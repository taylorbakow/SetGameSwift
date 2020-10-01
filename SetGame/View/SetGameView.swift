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
                        ForEach(game.displayedCards) { card in
                            CardView(card: card)
                                .onTapGesture {
                                    game.choose(card)
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
                        Text("Deal Cards").foregroundColor(Color.black)
                    }
                   Spacer()
                   Text("Score: \(game.score)")
                   Spacer()
                }
               .font(Font.title)
                
                   
           }
       }
    
    private let desiredCardWidth: CGFloat = 120
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SetGameView(game: SetGameController())
    }
}
