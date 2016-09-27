//
//  RPSViewController.swift
//  RockPaperScissors
//
//  Created by Eric Sailers on 9/27/16.
//  Copyright © 2016 Expressive Solutions. All rights reserved.
//

import UIKit

class RPSViewController: UIViewController {
    
    // MARK: - Properties
    
    var buttons = [UIButton]()
    
    @IBOutlet weak var signLabel: UILabel!
    @IBOutlet weak var gameStatusLabel: UILabel!
    @IBOutlet weak var rockButton: UIButton!
    @IBOutlet weak var paperButton: UIButton!
    @IBOutlet weak var scissorsButton: UIButton!
    @IBOutlet weak var playAgainButton: UIButton!
    
    // MARK: - Status bar white
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    // MARK: - UIViewController lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        buttons = [rockButton, paperButton, scissorsButton]
        update(gameState: .start)
    }

    // MARK: - Actions

    @IBAction func tapSign(_ sender: UIButton) {
        play(signInt: sender.tag)
        for button in buttons {
            if button != buttons[sender.tag] {
                button.isHidden = true
            } else {
                button.isEnabled = false
            }
        }
    }
    
    @IBAction func tapPlayAgain(_ sender: UIButton) {
        update(gameState: .start)
        for button in buttons {
            button.isHidden = false
            button.isEnabled = true
        }
    }
    
    // MARK: - Helpers
    
    func play(signInt: Int) {
        let opponentSign = selectSign(forOpponent: true, signInt: 0)
        let mySign = selectSign(signInt: signInt)
        let gameState = mySign.getGameState(sign: opponentSign)
        update(gameState: gameState)
        
        signLabel.text = opponentSign.signValue
        playAgainButton.isHidden = false
    }
    
    func update(gameState: GameState) {
        signLabel.text = "🐵"
        gameStatusLabel.text = gameState.status
        switch gameState {
        case .start:
            view.backgroundColor = UIColor.darkGray
        case .win:
            view.backgroundColor = Color.lightGreen
        case .lose:
            view.backgroundColor = Color.lightRed
        case .draw:
            view.backgroundColor = UIColor.lightGray
        }
        playAgainButton.isHidden = true
    }
    
}

