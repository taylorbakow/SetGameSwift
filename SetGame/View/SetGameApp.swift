//
//  SetGameApp.swift
//  SetGame
//
//  Created by Taylor Bakow on 9/20/20.
//

import SwiftUI

@main
struct SetGameApp: App {
    var body: some Scene {
        WindowGroup {
            SetGameView(game: SetGameController())
        }
    }
}

struct SetGameApp_Previews: PreviewProvider {
    static var previews: some View {
        SetGameView(game: SetGameController())
    }
}
