//
//  SquiggleView.swift

import SwiftUI

struct SetOvalShape: View{
    var body: some View {
        Capsule()
            .frame(width: 30, height: 80)
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
        HStack {
            ForEach(0..<number) { number in
                if(self.shading == .outlined){
                    ZStack{
                        Capsule()
                            .fill(Color.white).frame(width: 30, height: 80)
                        Capsule().opacity(setShading).frame(width: 30, height: 80)
                        Capsule().stroke(lineWidth: 4.0).frame(width: 30, height: 80)
                    }
                    
                }else{
                    ZStack{
                        Capsule().fill(setColor).frame(width: 30, height: 80)
                        Capsule().opacity(setShading).frame(width: 30, height: 80)
                        Capsule().stroke(lineWidth: 4.0).frame(width: 30, height: 80)

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

struct SetOvalView_Previews: PreviewProvider {
    static var previews: some View {
        SetOvalView(number: 3, color: .green, shading: .shaded)
    }
}
