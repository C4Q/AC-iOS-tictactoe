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
    let character = TicTacToeMove.init(x: xSymbol, o: oSymbol)
    
    
    @IBAction func enterMove(_ sender: GameButton) {
        move.enterMove()
                if move.player1Turn {
            
            gameArray[sender.row][sender.column] = character.o
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
            gameArray[sender.row][sender.column] = character.x
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
        for button in myButtons {
            button.setBackgroundImage(nil, for: .normal)
            button.isEnabled = true
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Execute code here
        
    }
    
}

