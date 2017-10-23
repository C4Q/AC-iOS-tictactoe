//
//  ViewController.swift
//  ticTacToe
//
//  Created by C4Q  on 9/27/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Clears button titles
        for i in ticTacToeButtons {
            i.setTitle(" ", for: .normal)
        }
        // Let player one go first
        turnLabel.text = playerOneTurnText
        // Hide end game buttons
        winLabel.isHidden = true
    }
    
    // Create an instance of the model class
    let ticTacToeModel = ticTacToeBrain()
    
    // Outlets
    @IBOutlet weak var playAgainButton: UIButton!
    @IBOutlet var ticTacToeButtons: [GameButton]!
    @IBOutlet weak var winLabel: UILabel!
    @IBOutlet weak var turnLabel: UILabel!
    
    // Create the matrix by calling one from the model
    lazy var ticTacToeMatrix = ticTacToeModel.startMatrix
    // Set turn text by using enum from model
    lazy var playerOneTurnText = ticTacToeModel.turn1.rawValue
    lazy var playerTwoTurnText = ticTacToeModel.turn2.rawValue
    
    @IBAction func ticTacToeButtonPressed(_ sender: GameButton) {
        // Button action if text is for player 1
        // Adds "X" to the matrix, sets turn to other player and disables pressed button
        if turnLabel.text == playerOneTurnText {
            ticTacToeMatrix[sender.row][sender.column] = "X"
            sender.setTitle("X", for: .normal)
            turnLabel.text = playerTwoTurnText
            sender.isUserInteractionEnabled = false
        // Button action if text is for player 2
        // Adds "O" to the matrix, sets turn to other player and disables pressed button
        } else {
            ticTacToeMatrix[sender.row][sender.column] = "O"
            sender.setTitle("O", for: .normal)
            turnLabel.text = playerOneTurnText
            sender.isUserInteractionEnabled = false
        }
        
        // Use logic from model to determin win conditions
        let win = ticTacToeModel.isThereAWinner(ticTacToeMatrix: ticTacToeMatrix)
        print(win)
        
        // Uses win to determine outcome of game and disables all buttons except for play again
        switch win {
        case _ where win.0 == "X" :
            winLabel.isHidden = false
            winLabel.text = "Player One Wins!"
            turnLabel.text = "The game has ended."
            for i in ticTacToeButtons {
                i.isUserInteractionEnabled = false
            }
            playAgainButton.isHidden = false
        case _ where win.0 == "O" :
            winLabel.isHidden = false
            winLabel.text = "Player Two Wins!"
            turnLabel.text = "The game has ended."
            for i in ticTacToeButtons {
                i.isUserInteractionEnabled = false
            }
            playAgainButton.isHidden = false
        case _ where win.0 == "D" :
            winLabel.isHidden = false
            winLabel.text = "It's a Draw!"
            turnLabel.text = "The game has ended."
            playAgainButton.isHidden = false
        default:
            turnLabel.text = turnLabel.text
            
        }

    }
    
    
    @IBAction func playAgainButtonPressed(_ sender: UIButton) {
        // Reset tic tac toe matrix
        ticTacToeMatrix = ticTacToeModel.startMatrix
        // Reset all buttons
        for i in ticTacToeButtons {
            i.isUserInteractionEnabled = true
            i.setTitle(" ", for: .normal)
        }
        // Sets it to player one's turn
        turnLabel.text = playerOneTurnText
        // Hide win label
        winLabel.isHidden = true
    }
}

