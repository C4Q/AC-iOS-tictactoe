//
//  ticTacToeBrain.swift
//  ticTacToe
//
//  Created by C4Q  on 9/29/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import Foundation

class TicTacToeModel {
    
    
    var moveArr: [Int] = [0, 0, 0,
                          0, 0, 0,
                          0, 0, 0]
    
    let winningIndicies: [[Int]] = [[0,1,2],
                                    [3,4,5],
                                    [6,7,8],
                                    [0,3,6],
                                    [1,4,7],
                                    [2,5,8],
                                    [0,4,8],
                                    [2,4,6]]
    
    var playerOneWins: Int = 0
    var playerTwoWins: Int = 0
    var turnNum: Int = 1
    var whosTurn: String = ""
    var gameWinner: String = ""
    var gameOver: Bool = false
    
    func whosTurnIsIt() {
        if turnNum % 2 == 1 {
            whosTurn = "Player 1"
        } else {
            whosTurn = "Player 2"
        }
    }
    
    func checkForWins() {
        for win in winningIndicies {
            if moveArr[win[0]] != 0 && moveArr[win[0]] == moveArr[win[1]] && moveArr[win[0]] == moveArr[win[2]] {
                gameOver = true
                if moveArr[win[0]] == 1 {
                    gameWinner = "Player 1"
                    playerOneWins += 1
                } else {
                    gameWinner = "Player 2"
                    playerTwoWins += 1
                }
            }
        }
        if !moveArr.contains(0) && gameWinner != "Player 1" && gameWinner != "Player 2" {
            gameWinner = "No One"
            gameOver = true
        }
    }
}
