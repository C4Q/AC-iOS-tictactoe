//
//  ticTacToeBrain.swift
//  ticTacToe
//
//  Created by C4Q  on 9/29/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import Foundation

class ticTacToeBrain {
    enum Players:Int {
        case one  = 1
        case two  = 2
    }
    
    var crossWins = 0
    var noughtWins = 0
    var win = false
    var activePlayer: Players = .one
    var gameState = [0,0,0,0,0,0,0,0,0]
    var turnCount = 0
    let winningCombination = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
    
    func resetGameState() {
        gameState = [0,0,0,0,0,0,0,0,0]
        turnCount = 0
        win = false
        activePlayer = .one
    }
    func winningCheck() {
        for combination in winningCombination {
            if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]] {
                if activePlayer == .one {
                    crossWins += 1
                    win = true
                } else if activePlayer == .two  {
                    noughtWins += 1
                    win = true
                }
            }
        }
    }
    func switchPlayer() {
        if activePlayer == .one {
            activePlayer = .two
        }
        else if activePlayer == .two {
            activePlayer = .one
        }
    }
}


