//
//  CardView.swift

import SwiftUI

struct CardView: View {
    
    var card: SetGame.Card
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                    RoundedRectangle(cornerRadius: cardCornerRadius).fill(Color.white)
                    createContent()
                    RoundedRectangle(cornerRadius: cardCornerRadius).stroke()
            }
        }
        .aspectRatio(2/3, contentMode: .fit)
        .padding(5)
    }
    
    private func createContent() -> some View{
        let cardContent = getShape()
        return ZStack {
            cardContent
       }
    }
    private func systemFont(for size: CGSize) -> Font {
        return Font.system(size: min(size.width, size.height) * fontScaleFactor)
    }
    private let cardCornerRadius: CGFloat = 10.0
    private let fontScaleFactor: CGFloat = 0.70
    
    private func getShape() -> AnyView{
        switch(card.shape) {
        case .diamond:
            return AnyView(DiamondView(number: card.number, color: card.color, shading: card.shading))
        case .oval:
            return AnyView(SetOvalView(number: card.number, color: card.color, shading: card.shading))
        case .squiggle:
            return AnyView(SquiggleView(number: card.number, color: card.color, shading: card.shading))
        }
    }
    
    var setColor: Color {
           switch(card.color) {
           case .red:
               return Color.red
           case .green:
               return Color.green
           case .purple:
               return Color.purple
           }
       }

   var setShading: Double {
       switch(card.shading) {
       case .solid:
           return 0.0
       case .shaded:
           return 0.5
       case .outlined:
           return 1.0
       }
   }

}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: SetGame.Card.init(id: 1, shape: .squiggle, color: SetColor.green, shading: .solid, number: 3))
    }
}
