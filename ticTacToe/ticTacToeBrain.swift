//
//  ticTacToeBrain.swift
//  ticTacToe
//
//  Created by C4Q  on 9/29/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import Foundation
import UIKit
var player1WinCounter = 0
var player2WinCounter = 0
var player1Won = false
var player2Won = false
let blankSpace = "_"
let xSymbol = "X"
let oSymbol = "O"
struct TicTacToeMove {
    var x: String 
    var o: String
}
var gameArray = [[blankSpace,blankSpace,blankSpace],
                 [blankSpace,blankSpace,blankSpace],
                 [blankSpace,blankSpace,blankSpace]]
var turnCounter = 0


class ticTacToeBrain {
    var player1Turn = false
    var player2Turn = false
    var turnTracker = 0
    func enterMove() {
        turnCounter += 1
        turnTracker += 1
        if turnTracker % 2 == 1 {
            player1Turn = true
            player2Turn = false
        }
        else {
            player2Turn = true
            player1Turn = false
        }
    }
    //Horizontal Victory
    func gameResult() {
        
        for row in gameArray {
            
            if row == [oSymbol,oSymbol,oSymbol] {
                player1Won = true
                player1WinCounter += 1
                break
                
            }
            else if row == [xSymbol,xSymbol,xSymbol] {
                player2Won = true
                player2WinCounter += 1
                break
                
            }
        }
        //Vertical Victory
        for c in 0..<gameArray.count {
            var column: [String] = []
            for r in 0..<gameArray.count {
                column.append(gameArray[r][c])
                if column == [oSymbol,oSymbol,oSymbol] {
                    player1Won = true
                    player1WinCounter += 1
                    break
                    
                }
                else if column == [xSymbol,xSymbol,xSymbol] {
                    player2Won = true
                    player2WinCounter += 1
                    break
                    
                }
            }
        }
        var diagonal: [String] = []
        //Diagonal victory
        for i in 0..<gameArray.count {

            for j in 0..<gameArray.count where i == j {
               diagonal.append(gameArray[i][j])
                if diagonal == [oSymbol,oSymbol,oSymbol] {
                    player1Won = true
                    player1WinCounter += 1
                    break
                    
                }
                else if diagonal == [xSymbol,xSymbol,xSymbol] {
                    player2Won = true
                    player2WinCounter += 1
                    break
                    
                }
            }
        }
        var diagonal2: [String] = []
        for x in 0..<gameArray.reversed().count {
            var reversedRow = Array(gameArray[x].reversed())
            for y in 0..<reversedRow.count where y == x {
                diagonal2.append(reversedRow[y])
                if diagonal2 == [oSymbol,oSymbol,oSymbol] {
                    player1Won = true
                    player1WinCounter += 1
                    
                }
                else if diagonal2 == [xSymbol,xSymbol,xSymbol] {
                    player2Won = true
                    player2WinCounter += 1
                    break
                }
            }
        }
        
    }

}




