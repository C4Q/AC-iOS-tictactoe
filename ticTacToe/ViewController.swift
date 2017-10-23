//
//  ViewController.swift
//  ticTacToe
//
//  Created by C4Q on 10/19/17.
//  Copyright © 2017 C4Q. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    //buttons
    @IBOutlet weak var buttonOne: UIButton!
    @IBOutlet weak var buttonTwo: UIButton!
    @IBOutlet weak var buttonThree: UIButton!
    @IBOutlet weak var buttonFour: UIButton!
    @IBOutlet weak var buttonFive: UIButton!
    @IBOutlet weak var buttonSix: UIButton!
    @IBOutlet weak var buttonSeven: UIButton!
    @IBOutlet weak var buttonEight: UIButton!
    @IBOutlet weak var buttonNine: UIButton!
    @IBOutlet weak var newGame: UIButton!
    
 
    
    
    //Label
    
    @IBOutlet weak var gameStatus: UILabel!
    
    @IBOutlet weak var playerOneWins: UILabel!
    
    @IBOutlet weak var playerTwoWins: UILabel!
    


    var currentPlayer = 1
    var currentGame = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    let winningCombinations = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    var nowPlaying = true
    var pOneWins = 0
    var pTwoWins = 0
    
    
    
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        
        if (currentGame[sender.tag] == 0 && nowPlaying == true){
            
            currentGame[sender.tag] = currentPlayer
        
        
        if currentPlayer == 1{
            sender.setImage(#imageLiteral(resourceName: "ex"), for: .normal)
            gameStatus.text = "Player Two's move"
            currentPlayer = 2
        }else{
            sender.setImage(#imageLiteral(resourceName: "oh"), for: .normal)
            gameStatus.text = "Player One's move"
            currentPlayer = 1
        }
            
        }
        
        for combination in winningCombinations {
            if currentGame[combination[0]] != 0 && currentGame[combination[0]] == currentGame[combination[1]] && currentGame[combination[1]] == currentGame[combination[2]] {
                
                nowPlaying = false
                newGame.isHidden = false
                gameStatus.isHidden = false
                
            
                if currentGame[combination[0]] == 1 {
                    
                    gameStatus.text = "Player One has won!"
                    pOneWins += 1
                    playerOneWins.text = "Player One Wins: \(pOneWins)"
                    return
                }
                    
                else {
                    
                   gameStatus.text = "Player Two has won!"
                    pTwoWins += 1
                    playerTwoWins.text = "Player Two Wins: \(pTwoWins)"
                    return
                }
            }
      
        }
        
        
        nowPlaying = false
        
        for i in currentGame
        {
            if i == 0
            {
                nowPlaying = true
                break
            }
        }
        
        if nowPlaying == false
        {
            gameStatus.text = "Draw!"
            gameStatus.isHidden = false
            newGame.isHidden = false
        }
    }
    
    
   
    
    
    // NEW GAME
    
    @IBAction func newGamePressed(_ sender: UIButton) {
        currentGame = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        nowPlaying = true
        currentPlayer = 1
        gameStatus.text = "Player One's move"
        newGame.isHidden = true
        
        
        let buttons = [buttonOne,buttonTwo,buttonThree,buttonFour,buttonFive,buttonSix, buttonSeven,buttonEight,buttonNine]
        
        
        for button in buttons{
            button?.setImage(nil, for: .normal)
    }
}

    
    
    
    
    
    
    
}
