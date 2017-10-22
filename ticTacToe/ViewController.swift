//
//  ViewController.swift
//  ticTacToe
//
//  Created by C4Q  on 9/27/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var btnOne: GameButton!
    @IBOutlet weak var btnTwo: GameButton!
    @IBOutlet weak var btnThree: GameButton!
    @IBOutlet weak var btnFour: GameButton!
    @IBOutlet weak var btnFive: GameButton!
    @IBOutlet weak var btnSix: GameButton!
    @IBOutlet weak var btnSeven: GameButton!
    @IBOutlet weak var btnEight: GameButton!
    @IBOutlet weak var btnNine: GameButton!
    @IBOutlet weak var newGameBtn: UIButton!
    
    @IBOutlet weak var playerOneScore: UILabel!
    @IBOutlet weak var playerTwoScore: UILabel!
    @IBOutlet weak var playerTurnLabel: UILabel!
    @IBOutlet var playerWinLabel: UILabel!
    
    @IBOutlet weak var winImage: UIImageView!
    @IBOutlet weak var drawImage: UIImageView!
    
    
    var buttons: [GameButton] = []
    var gameRules = ticTacToeBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view
        playerTurnLabel.text = "Player One Turn!"
        playerWinLabel.isHidden = true
        winImage.isHidden = true
        //drawImage.isHidden = true
        //updateScore()
        buttons = [btnOne, btnTwo, btnThree, btnFour, btnFive, btnSix, btnSeven, btnEight, btnNine]
    }
    
    @IBAction func gameButtonPressed(_ sender: GameButton) {
        gameRules.turnCounter += 1
        if gameRules.player {
            //playerOne
            gameRules.playerOneArray.insert(sender.tag)
            sender.setBackgroundImage(#imageLiteral(resourceName: "ximg"), for: .normal)
            playerTurnLabel.text = "Player Two's Turn!"
        } else {
            //playerTwo
            gameRules.playerTwoArray.insert(sender.tag)
            sender.setBackgroundImage(#imageLiteral(resourceName: "oimg") , for: .normal)
            playerTurnLabel.text = "Player One's Turn!"
        }
        sender.isEnabled = false
        
        //Win condition check
        gameRules.winningCondition()
        if gameRules.win == true {
            playerTurnLabel.isHidden = true
            if gameRules.player {
                playerWinLabel.text = "Player One WINS!"
                playerWinLabel.isHidden = false
                //sets win UIImage
                winImage.isHidden = false
            } else {
                playerWinLabel.text = "Player Two WINS!"
                playerWinLabel.isHidden = false
                winImage.isHidden = false
            }
            updateScore()
        } else if gameRules.win == false && gameRules.turnCounter == 9 {
         playerTurnLabel.isHidden = true
            playerWinLabel.text = "It's a DRAW!"
            playerWinLabel.isHidden = false
            //sets draw UIImage
            //drawImage.isHidden = false
        }
        gameRules.playerTurn(player: gameRules.player)
    }
    
    func updateScore(){
        playerOneScore.text = "P1 score: \(gameRules.playerOneScore)"
        playerTwoScore.text = "P2 score: \(gameRules.playerTwoScore)"
    }
    
    @IBAction func newGame(_ sender: UIButton) {
        newGame()
    }
    
    //newGame function
    func newGame() {
        for button in buttons {
            button.setBackgroundImage(nil, for: .normal)
            button.isEnabled = true
            newGameBtn.isHidden = false
        }
        winImage.isHidden = true
        //drawImage.isHidden = true
        gameRules.playerReset()
        gameRules.player = true
        playerWinLabel.isHidden = true
        playerTurnLabel.isHidden = false
        playerTurnLabel.text = "Player One's Turn!"
        
    }
}




