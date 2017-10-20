//
//  ticTacToeBrain.swift
//  ticTacToe
//
//  Created by C4Q  on 9/29/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import Foundation

class ticTacToeBrain {
    var playerTurn: Int = 1
    //1 = player1
    //2 = player2
    
//    let winConditions = [
//                    [1,2,3],
//                    [4,5,6],
//                    [7,8,9],
//                    [1,4,7],
//                    [2,5,8],
//                    [3,6,9],
//                    [1,5,9]
//                ]
    
    var gameMatrix: [[String]] = [
                                    ["", "", ""],
                                    ["", "", ""],
                                    ["", "", ""]
                                ]
    
    var win = false
    var tie = false
    
    enum WinConditions: String {
        case XXX
        case OOO
    }
    
    func changePlayerTurn() {
        (playerTurn == 1) ? (playerTurn = 2) : (playerTurn = 1)
    }
    
    func checkForWin() {
        for row in 0..<gameMatrix.count-1 {
            for column in 0..<gameMatrix.count-1 {
                
            }
        }
//        if (playerOneChoices.count + playerTwoChoices.count == 9) &&  {
//            tie = true
//        }
    }
}
