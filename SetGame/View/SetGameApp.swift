//
//  SetGameApp.swift
//  SetGame
//
//  Created by Student on 9/20/20.
//

import SwiftUI

@main
struct SetGameApp: App {
    var body: some Scene {
        WindowGroup {
            let game = SetGameController()
            SetGameView(game: game)
        }
    }
}

struct SetGameApp_Previews: PreviewProvider {
    static var previews: some View {
        let game = SetGameController()
        SetGameView(game: game)
    }
}
