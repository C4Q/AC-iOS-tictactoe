//
//  ViewController.swift
//  ticTacToe
//
//  Created by C4Q  on 9/27/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

// add pics to make look better

class ViewController: UIViewController {
    
    @IBOutlet var gameButton00: GameButton!
    @IBOutlet var gameButton01: GameButton!
    @IBOutlet var gameButton02: GameButton!
    @IBOutlet var gameButton10: GameButton!
    @IBOutlet var gameButton11: GameButton!
    @IBOutlet var gameButton12: GameButton!
    @IBOutlet var gameButton20: GameButton!
    @IBOutlet var gameButton21: GameButton!
    @IBOutlet var gameButton22: GameButton!
    
    @IBOutlet var currentPlayerTurnLabel: UILabel!
    @IBOutlet var turnLabel: UILabel!
    @IBOutlet var player1WinsLabel: UILabel!
    @IBOutlet var player2WinsLabel: UILabel!
    @IBOutlet var newGameButton: UIButton!
    
    var ticTacTocBrain = TicTacToeBrain()
    
    var gameButtons = [GameButton]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gameButtons = [gameButton00, gameButton01, gameButton02, gameButton10, gameButton11, gameButton12, gameButton20, gameButton21, gameButton22]
    }
    
    @IBAction func spacePressed(_ sender: GameButton) {
        if sender.currentImage == nil {
            if ticTacTocBrain.turnNumber % 2 == 1 {
                ticTacTocBrain.turnPlayerChose(playerKey: 1, x: sender.row, y: sender.column)
                sender.setImage(#imageLiteral(resourceName: "X_tictactoe"), for: .normal)
                if ticTacTocBrain.hasPlayer1Won() {
                    currentPlayerTurnLabel.text = "Player ONE has WON!"
                    player1WinsLabel.text = "Player One Wins: \(ticTacTocBrain.player1Wins)"
                    aPlayerHasWon()
                } else {
                    turnLabel.text = "Turn: \(ticTacTocBrain.turnNumber)"
                    currentPlayerTurnLabel.text = "Player two's turn"
                }
            } else {
                ticTacTocBrain.turnPlayerChose(playerKey: -1, x: sender.row, y: sender.column)
                sender.setImage(#imageLiteral(resourceName: "O_tictactoe"), for: .normal)
                if ticTacTocBrain.hasPlayer2Won() {
                    currentPlayerTurnLabel.text = "Player TWO has WON!"
                    player2WinsLabel.text = "Player Two Wins: \(ticTacTocBrain.player2Wins)"
                    aPlayerHasWon()
                } else {
                    turnLabel.text = "Turn: \(ticTacTocBrain.turnNumber)"
                    currentPlayerTurnLabel.text = "Player one's turn"
                }
            }
        }
        if ticTacTocBrain.turnNumber == 10 {
            gameIsATie()
        }
    }
    
    @IBAction func newGameButtonPressed(_ sender: UIButton) {
        for button in gameButtons {
            button.setImage(nil, for: .normal)
        }
        newGameButton.setTitle("Reset Game", for: .normal)
        enableGameButtons()
        ticTacTocBrain.resetGame()
        currentPlayerTurnLabel.text = "Player one's turn"
        turnLabel.text = "Turn: 1"
    }
    
    func gameIsATie() {
        currentPlayerTurnLabel.text = "It's a TIE!"
        for button in gameButtons {
            button.isEnabled = false
        }
        ticTacTocBrain.resetGame()
        newGameButton.setTitle("New Game", for: .normal)
    }
    
    func aPlayerHasWon() {
        disableGameButtons()
        newGameButton.setTitle("New Game", for: .normal)
    }
    
    func enableGameButtons() {
        for button in gameButtons {
            button.isEnabled = true
        }
    }
    
    func disableGameButtons() {
        for button in gameButtons {
            button.isEnabled = false
        }
    }
    
}
