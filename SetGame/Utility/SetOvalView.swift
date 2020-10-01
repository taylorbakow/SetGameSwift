//
//  SquiggleView.swift

import SwiftUI

struct SetOvalShape: View{
    var body: some View {
        Capsule()
            .frame(width: 30, height: 60)
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
                            .fill(Color.white)
                            .frame(width: 30, height: 60)
                        Capsule()
                            .stroke(lineWidth: 4.0)
                            .frame(width: 30, height: 60)
                    }
                }else if(self.shading == .solid){
                    ZStack{
                        Capsule().fill(setColor)
                            .frame(width: 30, height: 60)
                        Capsule().stroke(lineWidth: 4.0)
                            .frame(width: 30, height: 60)
                    }
                }else{
                    ZStack{
                        Capsule().opacity(0.5)
                            .frame(width: 30, height: 60)
                        Capsule().stroke(lineWidth: 4.0)
                            .frame(width: 30, height: 60)
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

struct SetOvalView_Previews: PreviewProvider {
    static var previews: some View {
        SetOvalView(number: 2, color: .green, shading: .shaded)
    }
}
