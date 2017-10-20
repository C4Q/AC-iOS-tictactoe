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
    
    //Tuple version of Array
    var playerOneArray: [(Int, Int)] = []
    var playerTwoArray: [(Int, Int)] = []
    
    //Tag version of Array
    var tagPlayerOneArray: [Int] = []
    var tagPlayerTwoArray: [Int] = []
    
    //Tuple version of win condition
    let winLeftToRightDiagonal = [(1,1), (2,2), (3,3)]
    let winRightToLeftDiagonal = [(1,3), (2,2), (3,1)]
    let winTopRow = [(1,1), (1,2), (1,3)]
    let winMiddleRow = [(2,1), (2,2), (2,3)]
    let winBottomRow = [(3,1), (3,2), (3,3)]
    let winRightColumn = [(1,3), (2,3), (3,3)]
    let winMiddleColumn = [(1,2), (2,2), (3,2)]
    let winLeftColumn = [(1,1), (2,1), (3,1)]
    
    //Tag version of win condition
    let tagWinLeftToRightDiagonal = [1,5,9]
    let tagWinRightToLeftDiagonal = [3,5,7]
    let tagWinTopRow = [1,2,3]
    let tagWinMiddleRow = [4,5,6]
    let tagWinBottomRow = [7,8,9]
    let tagWinRightColumn = [3,6,9]
    let tagWinMiddleColumn = [2,5,8]
    let tagWinLeftColumn = [1,4,7]
    
    
    
    func checkWinner () {
        //for 
        
        
        
        
        for (row, column) in playerOneArray where playerOneArray.count > 2 {
            var containsDoesntWork = 0
            for tuples in winTopRow {
                if (row == tuples.0 && column == tuples.1) {
                    containsDoesntWork += 1
                    if (row == tuples.0 && column == tuples.1) {
                        containsDoesntWork += 1
                        if (row == tuples.0 && column == tuples.1) {
                            containsDoesntWork += 1
                            if containsDoesntWork == 3 {
                                youWin = true
                                
                            }
                        }
                    }
                }
            }
        }
        for (row, column) in playerTwoArray where playerTwoArray.count > 2 {
            var containsDoesntWork = 0
            for tuples in winTopRow {
                if (row == tuples.0 && column == tuples.1) {
                    containsDoesntWork += 1
                    if (row == tuples.0 && column == tuples.1) {
                        containsDoesntWork += 1
                        if (row == tuples.0 && column == tuples.1) {
                            containsDoesntWork += 1
                            if containsDoesntWork == 3 {
                                youWin = true
                                
                            }
                        }
                    }
                }
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
