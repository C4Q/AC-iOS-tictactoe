//
//  ViewController.swift
//  ticTacToe
//
//  Created by C4Q  on 9/27/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let xoChechSet = CheckSetDecide()
    
    @IBOutlet weak var PlayerOneScoreLabel: UILabel!
    
    @IBOutlet weak var PlayerTwoScoreLabel: UILabel!
    
    @IBOutlet weak var playerTurnLabel: UILabel!
    @IBAction func cellButton(_ sender: UIButton) {
        
        let myCell = xoChechSet.getPlayer(senderButton: sender)
        print(myCell.playerName)
        
        if myCell.playerName == "Player One" && xoChechSet.freeze == false{
            sender.setImage(#imageLiteral(resourceName: "X"), for: .normal)
            sender.isEnabled = false
            playerTurnLabel.text = myCell.playerMessage
            if myCell.isWinner{
                xoChechSet.freeze = true
                PlayerOneScoreLabel.text = "Player One Score: \(xoChechSet.playerOneWins)"
            }
            print(xoChechSet.myDictionary)
            print(xoChechSet.freeze)
            
        }
        else if myCell.playerName == "Player Two" && xoChechSet.freeze == false{
            sender.setImage(#imageLiteral(resourceName: "O"), for: .normal)
            sender.isEnabled = false
            playerTurnLabel.text = myCell.playerMessage
            if myCell.isWinner{
                xoChechSet.freeze = true
                PlayerTwoScoreLabel.text = "Player Two Score: \(xoChechSet.playerTwoWins)"
            }
            print(xoChechSet.myDictionary)
            print(xoChechSet.freeze)
        }
    }
        
    @IBAction func resetButton(_ sender: UIButton) {
        xoChechSet.myDictionary = xoChechSet.resetCells(inputDictionary: xoChechSet.myDictionary)
        for button in xoChechSet.arrayOfButtons{
            button.setImage(nil, for: .normal)
            button.isEnabled = true
        }
        if xoChechSet.playerTurn == 1{
            playerTurnLabel.text = "Player One Play"
        }
        else{
            playerTurnLabel.text = "Player Two Play"
        }
    }

    override func viewDidLoad() {
        
        super.viewDidLoad()
        //Execute code here
    }
}

