//
//  SquiggleView.swift

import SwiftUI

struct DiamondShape: Shape{
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: 25, y: -25))
        path.addLine(to: CGPoint(x: 50, y: 0))
        path.addLine(to: CGPoint(x: 25, y: 25))
        path.addLine(to: CGPoint(x: 0, y: 0))
        return path
    }
        
}

struct DiamondView: View {
    var number: Int
    var color: SetColor
    var shading: SetShading
    init(number: Int, color: SetColor, shading: SetShading) {
        self.number = number
        self.color = color
        self.shading = shading
    }
    
    var body: some View {
        HStack {
            ForEach(0..<number) { number in
                if(self.shading == .outlined){
                    ZStack{
                        DiamondShape().fill(Color.white)
                        DiamondShape().opacity(setShading)
                        DiamondShape().stroke(lineWidth: 4.0)
                    }
                }else{
                    ZStack{
                        DiamondShape().fill(setColor)
                        DiamondShape().opacity(setShading)
                        DiamondShape().stroke(lineWidth: 4.0)
                    }
                }
            }
        }
        .foregroundColor(setColor)
        .aspectRatio(contentMode: .fit)
        .padding(number == 1 ? 130 : number == 2 ? 90 : 60)
    }
    
    var setColor: Color {
           switch(color) {
           case .red:
               return Color.red
           case .green:
               return Color.green
           case .purple:
               return Color.purple
           }
       }

   var setShading: Double {
       switch(shading) {
       case .solid:
           return 0.0
       case .shaded:
           return 0.5
       case .outlined:
           return 0.0
       }
   }
    
}

struct DiamondView_Previews: PreviewProvider {
    static var previews: some View {
        DiamondView(number: 2, color: .green, shading: .shaded)
    }
}
