//
//  SetGameView.swift
//  SetGame
//
//  Created by Taylor Bakow on 9/20/20.
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
        Array(repeating: GridItem(.flexible(), spacing: 5),
              count: getDesiredColumns(size: size))
    }
    
    //make this dynamic based on size
    func getDesiredColumns(size: CGSize) ->
        Int {
        var columns = 2
        var rows: Int
        var calculatedHeight: CGFloat
        repeat {
            columns += 1
            rows = game.displayedCards.count / columns
            calculatedHeight = heightRequired(rows: rows, width: size.width, columns: columns)
        } while calculatedHeight > size.height * 0.9
        return columns
    }
    
    private func heightRequired(rows: Int, width: CGFloat, columns: Int) -> CGFloat {
        return CGFloat(rows) * width / CGFloat(columns)
       }
    
    func body(for size: CGSize) -> some View {
           VStack {
                GeometryReader { geometry in
                    LazyVGrid(columns: columns(for: geometry.size), spacing: 5){
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
                Spacer()
                HStack {
                    Spacer()
                    Button(action: {
                        game.startNewGame()
                    }) {
                        Text("New Game").foregroundColor(Color.black)
                    }
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
