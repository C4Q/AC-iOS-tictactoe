//
//  ticTacToeBrain.swift
//  ticTacToe
//
//  Created by C4Q  on 9/29/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import Foundation

class ticTacToeBrain {
    
    var counter = 9
    
    var playerOne = Set<Int>()
    var playerTwo = Set<Int>()
    
    
    enum PlayerTurn: Int {
        case playerOne = 1
        case playerTwo = 2
    }
    
    var win = false
    
    func checkWin() {
        var winCondition: [Set<Int>] =
            [ [1, 2, 3],
              [4, 5, 6],
              [7, 8, 9],
              [1,4, 7],
              [2,5,8],
              [3,6,9],
              [1,5,9],
              [3,5,7]
        ]
        for array in winCondition {
            switch counter {
            case _ where counter % 2 == 1:
                if array.isSubset(of: playerOne) {
                    win = true
                }
            case _ where counter % 2 == 0:
                if array.isSubset(of: playerTwo) {
                    win = true
                }
                    default:
                    break
                }
            }
}
}
