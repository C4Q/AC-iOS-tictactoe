//
//  ticTacToeBrain.swift
//  ticTacToe
//
//  Created by C4Q  on 9/29/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import Foundation
class ticTacToeBrain {
    var playerOneSet = Set<Int>()
    var playerTwoSet = Set<Int>()
    var player: Bool = true
    var win = false
    //draw counter
    var turnCounter = 0
    //will keep winning score for each player
    var playerOneScore = 0
    var playerTwoScore = 0
    let winCombinations: [Set<Int>] =   [[1,2,3],
                                         [4,5,6],
                                         [7,8,9],
                                         [1,4,7],
                                         [2,5,8],
                                         [3,6,9],
                                         [1,5,9],
                                         [3,5,7]]
    //winning conditon function
    func winningCondition() {
        for possibleWins in winCombinations {
            if player {
                if possibleWins.isSubset(of: playerOneSet){
                    win = true
                    playerOneScore += 1
                }
            } else {
                if possibleWins.isSubset(of: playerTwoSet){
                    win = true
                    playerTwoScore += 1
                }
            }
        }
    }
    
   
    //player reset function
    func playerReset () {
        playerOneSet = Set<Int>()
        playerTwoSet = Set<Int>()
        turnCounter = 0
        win = false
    }
    //player turn function
    func playerTurn(player: Bool) {
        if player {
            self.player = false //player two
        } else {
            self.player = true //player one
        }
    }
}
