//
//  Sign.swift
//  RockPaperScissors
//
//  Created by Eric Sailers on 9/27/16.
//  Copyright © 2016 Expressive Solutions. All rights reserved.
//

import GameplayKit

let randomChoice = GKRandomDistribution(lowestValue: 0, highestValue: 2)

// Select sign for opponent or yourself
func selectSign(forOpponent opponent: Bool? = nil, signInt: Int) -> Sign {
    var signInt = signInt
    if opponent != nil { signInt = randomChoice.nextInt() }
    
    switch signInt {
    case 0: return .rock
    case 1: return .paper
    case 2: return .scissors
    default: return .rock
    }
}

enum Sign {
    case rock
    case paper
    case scissors
    
    // Computed property for emoji
    var signValue: String {
        switch self {
        case .rock: return "👊"
        case .paper: return "🖐"
        case .scissors: return "✌️"
        }
    }
    
    // Method to determine game state
    func getGameState(sign: Sign) -> GameState {
        switch self {
        case .rock:
            switch sign {
            case .rock: return .draw
            case .paper: return .lose
            case .scissors: return .win
            }
        case .paper:
            switch sign {
            case .rock: return .win
            case .paper: return .draw
            case .scissors: return .lose
            }
        case .scissors:
            switch sign {
            case .rock: return .lose
            case .paper: return .win
            case .scissors: return .draw
            }
        }
    }
}
