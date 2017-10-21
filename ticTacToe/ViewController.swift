//
//  ViewController.swift
//  ticTacToe
//
//  Created by C4Q  on 9/27/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit
//designed for iPhoneX
class ViewController: UIViewController {
    var allButtons: [GameButton] = []
    @IBOutlet weak var ticTacToeLabel: UILabel!
    @IBOutlet weak var playerTurnLabel: UILabel!
    @IBOutlet weak var winLabel: UILabel!
    @IBOutlet weak var loseLabel: UILabel!
    @IBOutlet weak var playAgain: UIButton!
    @IBOutlet weak var p1WinCount: UILabel!
    @IBOutlet weak var p2WinCount: UILabel!
    @IBOutlet weak var p1p2WinLabel: UILabel!
    @IBOutlet weak var button11: GameButton!
    @IBOutlet weak var button12: GameButton!
    @IBOutlet weak var button13: GameButton!
    @IBOutlet weak var button21: GameButton!
    @IBOutlet weak var button22: GameButton!
    @IBOutlet weak var button23: GameButton!
    @IBOutlet weak var button31: GameButton!
    @IBOutlet weak var button32: GameButton!
    @IBOutlet weak var button33: GameButton!
    @IBOutlet weak var jonSnow: UIImageView!
    @IBOutlet weak var nightKing: UIImageView!
    
    let ticTacToe = ticTacToeBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        winLabel.isHidden = true
        loseLabel.isHidden = true
        p1WinCount.isHidden = true
        p2WinCount.isHidden = true
        p1p2WinLabel.isHidden = true
    }
    
    @IBAction func gameButtons(_ sender: GameButton) {
        ticTacToe.clickABox()
        if ticTacToe.playerTracker == true {
            sender.setImage(#imageLiteral(resourceName: "xbutton"), for: .normal)
            playerTurnLabel.text = "Player Two's Turn"
            jonSnow.isHidden = true
            nightKing.isHidden = false
        } else {
            sender.setImage(#imageLiteral(resourceName: "oButton"), for: .normal)
            playerTurnLabel.text = "Player One's Turn"
            jonSnow.isHidden = false
            nightKing.isHidden = true
        }
        sender.isEnabled = false
        func addToArray() {
            if ticTacToe.playerTracker == true {
                ticTacToe.playerOneArray.append((sender.column, sender.row))
                ticTacToe.tagPlayerOneArray.append(sender.tag)
            } else {
                ticTacToe.playerTwoArray.append((sender.column, sender.row))
                ticTacToe.tagPlayerTwoArray.append(sender.tag)
            }
        }
        addToArray()
        ticTacToe.checkWinner()
        if ticTacToe.youWin == true {
            playerTurnLabel.isHidden = true
            if ticTacToe.playerTracker == true {
                winLabel.text = "P1 Wins!"
                winLabel.isHidden = false
                nightKing.isHidden = true
                jonSnow.isHidden = false
            } else {
                winLabel.text = "P2 Wins!"
                winLabel.isHidden = false
                jonSnow.isHidden = true
                nightKing.isHidden = false
            }
            allButtons = [button11, button12, button13, button21, button22, button23, button31, button32, button33]
            for button in allButtons {
                button.isEnabled = false
                p1WinCount.isHidden = false
                p2WinCount.isHidden = false
                p1p2WinLabel.isHidden = false
                p1WinCount.text = "\(ticTacToe.p1WinCount)"
                p2WinCount.text = "\(ticTacToe.p2WinCount)"
            }
        }
        if ticTacToe.draw == true {
            winLabel.text = "It's a Draw"
            winLabel.isHidden = false
            nightKing.isHidden = true
            jonSnow.isHidden = true
            playerTurnLabel.isHidden = true
        }
    }
    
    @IBAction func playAgainButton(_ sender: UIButton) {
        allButtons = [button11, button12, button13, button21, button22, button23, button31, button32, button33]
        ticTacToe.youWin = false
        playerTurnLabel.isHidden = false
        ticTacToe.playerOneArray = []
        ticTacToe.playerTwoArray = []
        ticTacToe.tagPlayerOneArray = []
        ticTacToe.tagPlayerTwoArray = []
        ticTacToe.clickCount = 0
        ticTacToe.draw = false
        for button in allButtons {
            button.isEnabled = true
            button.setImage(nil, for: .normal)
        }
        winLabel.isHidden = true
        loseLabel.isHidden = true
        if ticTacToe.playerTracker == false {
            jonSnow.isHidden = false
            nightKing.isHidden = true
        } else {
            nightKing.isHidden = false
            jonSnow.isHidden = true
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}

