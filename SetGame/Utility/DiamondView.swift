
import SwiftUI

struct DiamondShape: Shape{
    func path(in rect: CGRect) -> Path {
        var path = Path()
//            path.move(to: CGPoint(x: rect.midX, y: rect.minY))
//            path.addLine(to: CGPoint(x: rect.minX, y: rect.midY))
//            path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
//            path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
//            path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        path.move(to: CGPoint(x: 0, y: 0))
              path.addLine(to: CGPoint(x: 200, y: 200))
              path.addLine(to: CGPoint(x: 400, y: 0))
              path.addLine(to: CGPoint(x: 200, y: -200))
              path.addLine(to: CGPoint(x: 0, y: 0))
        
        let scale: CGFloat = rect.height / path.boundingRect.height
        path = path.applying(
            CGAffineTransform(scaleX: scale, y: scale)
        )
        return path.offsetBy(
            dx: rect.midX - path.boundingRect.midX,
            dy: rect.midY - path.boundingRect.midY
        )
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
                        DiamondShape().stroke(lineWidth: 3.0)
                    }
                }else if(self.shading == .solid){
                    ZStack{
                        DiamondShape().fill(setColor)
                        DiamondShape().stroke(lineWidth: 1.0)
                    }
                }else{
                    ZStack{
                        DiamondShape().opacity(0.5)
                        DiamondShape().stroke(lineWidth: 1.0)
                    }
                }
            }
        }
        .foregroundColor(setColor)
        .aspectRatio(3, contentMode: .fit)
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
        DiamondView(number: 3, color: .green, shading: .outlined)
    }
}
