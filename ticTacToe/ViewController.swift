//
//  ViewController.swift
//  ticTacToe
//
//  Created by C4Q  on 9/27/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    

    
    @IBOutlet weak var topLeft: UIButton!
    @IBOutlet weak var topCenter: UIButton!
    @IBOutlet weak var topRight: UIButton!
    @IBOutlet weak var middleLeft: UIButton!
    @IBOutlet weak var middleCenter: UIButton!
    @IBOutlet weak var middleRight: UIButton!
    @IBOutlet weak var bottomLeft: UIButton!
    @IBOutlet weak var bottomCenter: UIButton!
    @IBOutlet weak var bottomRight: UIButton!
    
    @IBOutlet weak var turnLabel: UILabel!
    @IBOutlet weak var scoreBoard: UILabel!
    @IBOutlet weak var resetScoreButton: UIButton!
    @IBOutlet weak var newGameButton: UIButton!
    
    var buttonArr: [UIButton] = []
    
    let model = TicTacToeModel()
    
    
    
    override func viewDidLoad() {
        model.turnNum = 1
        buttonArr = [topLeft, topCenter, topRight,
                     middleLeft, middleCenter, middleRight,
                     bottomLeft, bottomCenter, bottomRight]
        model.whosTurnIsIt()
        turnLabel.text = "It's \(model.whosTurn)'s turn"
    }
    
    
    @IBAction func newGame(_ sender: UIButton) {
        model.gameOver = false
        model.turnNum = 1
        model.gameWinner = ""
        model.whosTurnIsIt()
        turnLabel.text = "It's \(model.whosTurn)'s turn"
        scoreBoard.text = "Player 1 Wins: \(model.playerOneWins) | Player 2 Wins: \(model.playerTwoWins)"
        for button in buttonArr {
            button.setBackgroundImage(nil, for: .normal)
            button.isUserInteractionEnabled = true
        }
        model.moveArr = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    }
    
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        if model.moveArr[sender.tag] == 0 {
            if model.whosTurn == "Player 1" {
                sender.setBackgroundImage(#imageLiteral(resourceName: "6cdb85fa1b39d6e96770df5ab0997f1f--buy-frames-floral-illustrations"), for: .normal)
                model.moveArr[sender.tag] = 1
            } else if model.whosTurn == "Player 2" {
                sender.setBackgroundImage(#imageLiteral(resourceName: "64d590295b52cfacfb8c6e56ed152669--watercolor-flowers-watercolor-tattoos"), for: .normal)
                model.moveArr[sender.tag] = 2
            }
            model.checkForWins()
            if model.gameOver == true {
                turnLabel.text = "\(model.gameWinner) Wins!"
                for button in buttonArr {
                    button.isUserInteractionEnabled = false
                }
                scoreBoard.text = "Player 1 Wins: \(model.playerOneWins) | Player 2 Wins: \(model.playerTwoWins)"
            } else {
                model.turnNum += 1
                model.whosTurnIsIt()
                turnLabel.text = "It's \(model.whosTurn)'s turn"
            }
        } else {
            turnLabel.text = "Please choose an empty square."
        }
    }
    
    
    
    
    @IBAction func resetScoreButtonPressed(_ sender: UIButton) {
        model.playerOneWins = 0
        model.playerTwoWins = 0
        scoreBoard.text = "Player 1 Wins: \(model.playerOneWins) | Player 2 Wins: \(model.playerTwoWins)"
    }
}
