//
//  ViewController.swift
//  ticTacToe
//
//  Created by Tyler Zhao on 10/21/2017.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        resetGame()
        playAgainButton.isHidden = true
    }
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var whosTurnLabel: UILabel!
    @IBOutlet weak var xsScore: UILabel!
    @IBOutlet weak var osScore: UILabel!
    @IBOutlet weak var b1: UIButton!
    @IBOutlet weak var b2: UIButton!
    @IBOutlet weak var b3: UIButton!
    @IBOutlet weak var b4: UIButton!
    @IBOutlet weak var b5: UIButton!
    @IBOutlet weak var b6: UIButton!
    @IBOutlet weak var b7: UIButton!
    @IBOutlet weak var b8: UIButton!
    @IBOutlet weak var b9: UIButton!
    @IBOutlet weak var playAgainButton: UIButton!
    
    var buttonArr: [UIButton] {
        return [b1, b2, b3, b4, b5, b6, b7, b8, b9]
    }
    
    @IBAction func gameButtonPressed(_ sender: UIButton) {
        
        if ticTacToeArr[sender.tag - 1] == 0 {
            ticTacToeArr[sender.tag - 1] = currentPlayer
            if currentPlayer == 1 {
                sender.setImage(UIImage(named: "Cross.png"), for: UIControlState())
                whosTurnLabel.text = "O's Turn"
                currentPlayer = 2
            } else {
                sender.setImage(UIImage(named: "Nought.png"), for: UIControlState())
                currentPlayer = 1
                whosTurnLabel.text = "X's Turn"
            }
        }
        checkCombo()
        gameResult()
    }
    
    @IBAction func gameResetButton(_ sender: UIButton) {
        if sender.tag == 1 {
            playAgain()
            resetScore()
        }
        if sender.tag == 5 {
            playAgain()
        }
    }
    
    //Resets score and game
    func resetGame() {
        playAgain()
        resetScore()
    }
    
    //Disables buttons
    func gameNotActive() {
        for i in buttonArr {
            i.isEnabled = false
        }
        playAgainButton.isHidden = false
    }
    
    //Resets game, enable buttons, doesn't reset score
    func playAgain() {
        currentPlayer = 1
        whoWon = 0
        ticTacToeArr = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        whosTurnLabel.text = "X goes first"
        xsScore.text = "X Score: \(xScore)"
        osScore.text = "O Score: \(oScore)"
        playAgainButton.isHidden = true
        
        //Re-enables game board
        for i in buttonArr {
            i.isEnabled = true
        }
        //Reset button img
        for i in 1...9 {
            let button = view.viewWithTag(i) as! UIButton
            button.setImage(nil, for: UIControlState())
        }
    }
    
    //Win Checker
    func gameResult() {
        //X wins
        if whoWon == 1 {
            gameNotActive()
            whosTurnLabel.text = "X Wins!"
        }
        //O wins
        else if whoWon == 2 {
            gameNotActive()
            whosTurnLabel.text = "O Wins!"
        }
        //Tie
        else if whoWon == 3 && gameActive == false {
            gameNotActive()
            whosTurnLabel.text = "Draw!"
        }
    }
}



