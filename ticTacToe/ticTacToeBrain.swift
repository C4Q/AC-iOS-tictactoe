//
//  ticTacToeBrain.swift
//  ticTacToe
//
//  Created by Tyler Zhao on 10/21/2017.
//  Copyright © 2017 C4Q . All rights reserved.
//

import Foundation

var currentPlayer = 1 //X

var xScore = 0
var oScore = 0
var gameActive = true
var whoWon = 0

var ticTacToeArr = [0, 0, 0, 0, 0, 0, 0, 0, 0]

let winningCombinationArr = [[0, 1, 2], [3, 4, 5],
                             [6, 7, 8], [0, 3, 6],
                             [1, 4, 7], [2, 5, 8],
                             [0, 4, 8], [2, 4, 6]]

func resetScore() {
    xScore = 0
    oScore = 0
    whoWon = 0
}

func checkCombo() {
    for combo in winningCombinationArr {
        if ticTacToeArr[combo[0]] != 0 && ticTacToeArr[combo[0]] == ticTacToeArr[combo[1]]
            && ticTacToeArr[combo[1]] == ticTacToeArr[combo[2]] {
            
            //x wins
            if ticTacToeArr[combo[0]] == 1 {
                xScore += 1
                currentPlayer = 1
                whoWon = 1
                gameActive = false
            //o wins
            } else {
                oScore += 1
                whoWon = 2
                gameActive = false
            }
        }
    }
    gameActive = false
    for i in ticTacToeArr {
        if i == 0 {
            gameActive = true
            break
       
        //tie
        } else if i != 0 && whoWon != 1 && whoWon != 2 {
            whoWon = 3
        }
    }
}







