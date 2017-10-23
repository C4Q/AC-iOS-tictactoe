//
//  ViewController.swift
//  ticTacToe
//
//  Created by C4Q  on 9/27/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var label: UILabel!
    
    var currentPlayer = 1 // Cross
    var gameCondition = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    var gameIsActive = true
    
    let winningCombinations = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
    
    @IBAction func gameButtons(_ sender: UIButton) {
        
        if gameCondition[sender.tag-1] == 0 && gameIsActive
        {
            
            gameCondition[sender.tag-1] = currentPlayer
            
            if currentPlayer == 1 {
                sender.setTitle("X", for: UIControlState())
                currentPlayer = 2
                label.text = "Nought turn"
            }
            else {
                sender.setTitle("O", for: UIControlState())
                currentPlayer = 1
                label.text = "Cross turn"
            }
        }
        
        for combinations in winningCombinations {
            if gameCondition[combinations[0]] != 0 && gameCondition[combinations[0]] == gameCondition[combinations[1]] && gameCondition[combinations[0]] == gameCondition[combinations[2]] {
                gameIsActive = false
                
                if gameCondition[combinations[0]] == 1 {
                    label.text = "Cross has won!"
                }
                else {
                    label.text = "Nought has won!"
                }
            }
        }
        
        
        var justNumber = 1
        
        if gameIsActive == true{
            for i in gameCondition{
                justNumber = i*justNumber
            }
            if justNumber != 0
            {
                label.text = "It was a draw"
                
            }
        }
    }
    
    @IBAction func newGame(_ sender: Any)
    {
        currentPlayer = 1 // Cross
        gameCondition = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        gameIsActive = true
        label.text = "Welcome to game! Cross starts"
        
        for i in 1...9 {
            let button = view.viewWithTag(i) as! UIButton
            button.setTitle(nil, for: UIControlState())
        }
    }
    
}

