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
    }
    
    
    @IBOutlet weak var newGameButton: UIButton!
    @IBOutlet weak var playerTurnLabel: UILabel!
    
    var ticTacToeModel = ticTacToeBrain()
    
    var gameOn = true
    var currentPlayer = 1 //Player One == circle
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0] //for model
    let winnningCombos = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]] //for model
    
    @IBAction func currentPlayerMove(_ sender: UIButton) {
        // check if gamestate is available for a move
        if gameState[sender.tag - 1] == 0 && gameOn == true {
            gameState[sender.tag - 1] = currentPlayer
            //alternate between players
            if currentPlayer == 1 {
                sender.setImage(#imageLiteral(resourceName: "o"), for: .normal)
                labelChange()
                currentPlayer = 2
            } else {
                sender.setImage(#imageLiteral(resourceName: "x"), for: .normal)
                labelChange()
                currentPlayer = 1
            }
        }
        
        //check for winning combo
        for combo in winnningCombos {
            if gameState[combo[0]] != 0 && gameState[combo[0]] == gameState[combo[1]] && gameState[combo[1]] == gameState[combo[2]] {
                
                gameOn = false
                
                //To see who has won
                if gameState[combo[0]] == 1 {
                    //o has won
                    playerTurnLabel.text = "O WINS! 🎉"
                } else {
                    //x has won
                    playerTurnLabel.text = "X WINS! 🎉"

                }
                newGameButton.isHidden = false
            }
        }
        gameOn = false
        
        //check for draw
        for state in gameState {
            if state == 0 {
                gameOn = true
                break
            }
        }
        
        if gameOn == false {
            playerTurnLabel.text = "DRAW!"
            newGameButton.isHidden = false
        }
    }
    
    //change label text
    func labelChange() {
        if currentPlayer == 1 {
            playerTurnLabel.text = "Player Twos' turn. Place an X"
        } else {
            playerTurnLabel.text = "Player Ones' turn. Place an O"
        }
    }
    
    //To start new game

    @IBAction func newGame(_ sender: UIButton) {
        newGameButton.isHidden = true
        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        gameOn = true
        currentPlayer = 1
        //reset all images
        for image in 1...9 {
            let newButton = view.viewWithTag(image) as! UIButton
            newButton.setImage(nil, for: .normal)
        }
    }
    
    

    
}

