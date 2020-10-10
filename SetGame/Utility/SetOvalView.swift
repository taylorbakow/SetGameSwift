
import SwiftUI

struct SetOvalShape: Shape{
    func path(in rect: CGRect) -> Path {
        var path = Path()
//        path.move(to: CGPoint(x: rect.minX, y: rect.minX))
//        path.addCurve(to: CGPoint(x: rect.maxX, y: rect.minY),
//                      control1: CGPoint(x: rect.minX + (rect.maxX / 10), y: rect.maxY - (rect.maxY * 1.5)),
//                      control2: CGPoint(x: rect.maxX - (rect.maxX / 10), y: rect.maxY - (rect.maxY * 1.5)))
//        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY * 2))
//        path.addCurve(to: CGPoint(x: rect.minX, y: rect.maxY * 2),
//                      control1: CGPoint(x: rect.maxX - (rect.maxX / 10), y: rect.maxY + (rect.maxY * 1.5)),
//                      control2: CGPoint(x: rect.minX + (rect.maxX / 10), y: rect.maxY + (rect.maxY * 1.5)))
//        path.addLine(to: CGPoint(x: rect.minX, y: rect.minX))
        path.move(to: CGPoint(x: 0, y: 0))
        path.addCurve(to: CGPoint(x: 200, y: 0),
                              control1: CGPoint(x: 20, y: -80), control2: CGPoint(x: 180, y: -80))
        path.addLine(to: CGPoint(x: 200, y: 400))
        path.addCurve(to: CGPoint(x: 0, y: 400),
                              control1: CGPoint(x: 180, y: 480), control2: CGPoint(x: 20, y: 480))
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

struct SetOvalView: View {
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
                        SetOvalShape().fill(Color.white)
                        SetOvalShape().stroke(lineWidth: 3.0)
                    }
                }else if(self.shading == .solid){
                    ZStack{
                        SetOvalShape().fill(setColor)
                        SetOvalShape().stroke(lineWidth: 1.0)
                    }
                }else{
                    ZStack{
                        SetOvalShape().opacity(0.5)
                        SetOvalShape().stroke(lineWidth: 1.0)
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

struct SetOvalView_Previews: PreviewProvider {
    static var previews: some View {
        SetOvalView(number: 3, color: .green, shading: .solid)
    }
}
