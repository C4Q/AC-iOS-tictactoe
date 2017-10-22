//
//  ViewController.swift
//  ticTacToe
//
//  Created by C4Q  on 9/27/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var noughtScore: UILabel!
    @IBOutlet weak var crossScore: UILabel!
    @IBOutlet var allButtons: [UIButton]!
    @IBOutlet weak var winCount: UILabel!
    var ticTacToe = ticTacToeBrain()
    override func viewDidLoad() {
        super.viewDidLoad()
        winLabel.text = "Let's go players"
    }
    
    @IBAction func restartButton(_ sender: UIButton) {
        for button in allButtons {
            button.isEnabled = true
        }
        winLabel.text = "Lets go Players"
        for buttons in allButtons {
            buttons.setImage(nil, for: .normal)
            ticTacToe.resetGameState()
        }
    }
    
    
    @IBOutlet weak var winLabel: UILabel!
    @IBAction func crossButtonPressed(_ sender: UIButton) {
        ticTacToe.turnCount += 1
        if ticTacToe.gameState[sender.tag-1] == 0  {
            ticTacToe.gameState[sender.tag-1] = ticTacToe.activePlayer.rawValue
            if ticTacToe.activePlayer == .one {
                sender.setImage(#imageLiteral(resourceName: "Cross"), for: .normal)
                
                
            }
            else if ticTacToe.activePlayer == .two {
                sender.setImage(#imageLiteral(resourceName: "Nought"), for: .normal)
                
            }
        }
        ticTacToe.winningCheck()
        if ticTacToe.win {
            //if someone wins
            //check who won
            if ticTacToe.activePlayer == .one {
                crossScore.text = "\(ticTacToe.crossWins)"
                winLabel.text = "Cross has won"
            } else {
                winLabel.text = "Nought has won"
                noughtScore.text = "\(ticTacToe.noughtWins)"
            }
            for button in allButtons {
                button.isEnabled = false
            }
        }
        else if ticTacToe.turnCount == 9 {
            winLabel.text = "It a Draw"
        }
         ticTacToe.switchPlayer()
    }
}









