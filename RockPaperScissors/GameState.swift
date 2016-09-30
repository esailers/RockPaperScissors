//
//  GameState.swift
//  RockPaperScissors
//
//  Created by Eric Sailers on 9/27/16.
//  Copyright © 2016 Expressive Solutions. All rights reserved.
//

enum GameState {
    case start
    case win
    case lose
    case draw
    
    // Computed property for status. Enums may not contain stored properties.
    var status: String {
        switch self {
        case .start:
            return "Rock, Paper, Scissors?"
        case .win:
            return "You Won!"
        case .lose:
            return "You Lost!"
        case .draw:
            return "It's a Draw!"
        }
    }
}
