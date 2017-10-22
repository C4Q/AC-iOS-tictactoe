//
//  ticTacToeBrain.swift
//  ticTacToe
//
//  Created by C4Q  on 9/29/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import Foundation
var viewController = ViewController()
class ticTacToeBrain {
    var playerOneArray = Set<Int>()
    var playerTwoArray = Set<Int>()
    var win = false
    var player: Bool = true
    //counter for draw conditon
    var turnCounter = 0
    //will keep winning score for each player
    var playerOneScore = 0
    var playerTwoScore = 0
    
    
    //Possible wins
    let winCombinations: [Set<Int>] =   [[1,2,3],
                                         [4,5,6],
                                         [7,8,9],
                                         [1,4,7],
                                         [2,5,8],
                                         [3,6,9],
                                         [1,5,9],
                                         [3,5,7]]
    
    //Winning conditon function
    func winningCondition() {
        for possibleWins in winCombinations {
            if player {
                if possibleWins.isSubset(of: playerOneArray){
                    win = true
                    playerOneScore += 1
                }
            } else {
                if possibleWins.isSubset(of: playerTwoArray){
                    win = true
                    playerTwoScore += 1
                }
            }
        }
    }
    
    //Player reset function
    func playerReset () {
        playerOneArray = Set<Int>()
        playerTwoArray = Set<Int>()
        turnCounter = 0
        win = false
    }
    
    //Player turn function
    func playerTurn(player: Bool) {
        if player {
            self.player = false //player two
        } else {
            self.player = true //player one
        }
    }
}
