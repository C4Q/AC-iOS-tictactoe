//
//  ViewController.swift
//  ticTacToe
//
//  Created by C4Q  on 9/27/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    

    
    
    @IBOutlet weak var turnDisplay: UILabel!
    
    @IBOutlet weak var newGame: UIButton!
    
    @IBOutlet weak var player1Score: UILabel!
    
    @IBOutlet weak var player2Score: UILabel!
    
    @IBOutlet weak var button1_1: GameButton!
    
    @IBOutlet weak var button1_2: GameButton!
    
    @IBOutlet weak var button1_3: GameButton!
    
    @IBOutlet weak var button2_1: GameButton!
    
    @IBOutlet weak var button2_2: GameButton!
    
    @IBOutlet weak var button2_3: GameButton!
    
    @IBOutlet weak var button3_1: GameButton!
    
    @IBOutlet weak var button3_2: GameButton!
    
    @IBOutlet weak var button3_3: GameButton!
    
    @IBOutlet var myButtons: [GameButton]!
    
    
    let move = ticTacToeBrain()
    
    @IBAction func enterMove(_ sender: GameButton) {
        move.enterMove()
                if move.player1Turn {
            
            gameArray[sender.row][sender.column] = oSymbol
            turnDisplay.text = "Player Two's Turn"
            sender.setBackgroundImage(#imageLiteral(resourceName: "tictactoe O"), for: .normal)
            move.gameResult()
            if player1Won {
                turnDisplay.text = "Player One Wins!!!"
                player1Score.text = "P1 score: \(player1WinCounter)"
                for button in myButtons {
                    button.isEnabled = false
                    
                }
                
            }
        }
            
        else {
            gameArray[sender.row][sender.column] = xSymbol
            turnDisplay.text = "Player One's Turn"
            sender.setBackgroundImage(#imageLiteral(resourceName: "tictactoeX"), for: .normal)
            move.gameResult()
            if player2Won{
                turnDisplay.text = "Player Two Wins!!!"
                player2Score.text = "P2 score: \(player2WinCounter)"
                
                for button in myButtons {
                    button.isEnabled = false
                  
                }
                
            }
            
        }
        if !player1Won && !player2Won && turnCounter == 9 {
            turnDisplay.text = "Draw nobody wins"
            sender.isEnabled = false
        }
      

    
        sender.isEnabled = false
    }
    
    @IBAction func newGame(_ sender: UIButton) {
        move.turnTracker = 0
        turnDisplay.text = "Player One's Turn"
        gameArray = [[blankSpace,blankSpace,blankSpace],
                                 [blankSpace,blankSpace,blankSpace],
                                 [blankSpace,blankSpace,blankSpace]]
        player1Won = false
        player2Won = false
        turnCounter = 0
        
        button1_1.setBackgroundImage(nil, for: .normal)
        button1_1.isEnabled = true
        button1_2.setBackgroundImage(nil, for: .normal)
        button1_2.isEnabled = true
        button1_3.setBackgroundImage(nil, for: .normal)
        button1_3.isEnabled = true
        button2_1.setBackgroundImage(nil, for: .normal)
        button2_1.isEnabled = true
        button2_2.setBackgroundImage(nil, for: .normal)
        button2_2.isEnabled = true
        button2_3.setBackgroundImage(nil, for: .normal)
        button2_3.isEnabled = true
        button3_1.setBackgroundImage(nil, for: .normal)
        button3_1.isEnabled = true
        button3_2.setBackgroundImage(nil, for: .normal)
        button3_2.isEnabled = true
        button3_3.setBackgroundImage(nil, for: .normal)
        button3_3.isEnabled = true
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Execute code here
        
    }
    
}

