//
//  SquiggleView.swift

import SwiftUI

struct DiamondShape: Shape{
    func path(in rect: CGRect) -> Path {
        var path = Path()
            path.move(to: CGPoint(x: rect.midX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.midY))
            path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
            path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
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
        HStack{
            ForEach(0..<number) { number in
                if(self.shading == .outlined){
                    ZStack{
                        DiamondShape().fill(Color.white)
                            .frame(maxWidth: 50, maxHeight: 50)
                        DiamondShape().stroke(lineWidth: 4.0)
                            .frame(maxWidth: 50, maxHeight: 50)
                    }
                }else if(self.shading == .solid){
                    ZStack{
                        DiamondShape().fill(setColor)
                            .frame(maxWidth: 50, maxHeight: 50)
                        DiamondShape().stroke(lineWidth: 4.0)
                            .frame(maxWidth: 50, maxHeight: 50)
                        
                    }
                }else{
                    ZStack{
                        DiamondShape().opacity(0.5)
                            .frame(maxWidth: 50, maxHeight: 50)
                        DiamondShape().stroke(lineWidth: 4.0)
                            .frame(maxWidth: 50, maxHeight: 50)
                        
                    }
                }
            }
        }
        .foregroundColor(setColor)
        .aspectRatio(contentMode: .fit)
        .padding(5)
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
}

struct DiamondView_Previews: PreviewProvider {
    static var previews: some View {
        DiamondView(number: 3, color: .green, shading: .shaded)
    }
}
