//
//  ticTacToeBrain.swift
//  ticTacToe
//
//  Created by C4Q  on 9/29/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import Foundation
import UIKit
//THIS IS THE MODEL

class ticTacToeBrain {
    var playerTracker: Bool = false
    var youWin = false
    var p1WinCount = 0
    var p2WinCount = 0
    //Tuple version of Array
    var playerOneArray: [(Int, Int)] = []
    var playerTwoArray: [(Int, Int)] = []
    
    //Tag version of Array
    var tagPlayerOneArray: [Int] = []
    var tagPlayerTwoArray: [Int] = []
    
    let winConditions: [Set<Int>] = [
        [1,5,9],
        [3,5,7],
        [1,2,3],
        [4,5,6],
        [7,8,9],
        [3,6,9],
        [2,5,8],
        [1,4,7]]
    
    func checkWinner () {
        for winCondition in winConditions {
            if winCondition.isSubset(of: Set(tagPlayerOneArray)) {
                youWin = true
                p1WinCount += 1
            }
        }
        for winCondition in winConditions {
            if winCondition.isSubset(of: Set(tagPlayerTwoArray)) {
                youWin = true
                p2WinCount += 1
            }
        }
    }
    
    func clickABox() {
        if playerTracker == true {
            playerTracker = false
        } else {
            playerTracker = true
        }
    }
}
