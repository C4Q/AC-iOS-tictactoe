//
//  ticTacToeBrain.swift
//  ticTacToe
//
//  Created by C4Q  on 9/29/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import Foundation
import UIKit

class TicTacToeBrain {
    var grid = [[0,0,0],
                [0,0,0],
                [0,0,0]]
    var player = 1
    
    func switchPlayer() {
        if player == 1{
            player = -1
        } else {
            player = 1
        }
    }
    
    func resetBoard() {
        grid = [[0,0,0],
                [0,0,0],
                [0,0,0]]
        player = 1
    }
}


class WinChecker {
    var p1WinCount = 0
    var p2WinCount = 0
    var winDetected = false
    var draw = false
    var winner = ""
    
    func check(grid: [[Int]]) {
        func rowCheck() {
        var rowSum1 = 0
        for row in grid {
            rowSum1 = row.reduce(0, { x, y in x + y})
            if rowSum1 == 3 {
                winDetected = true
                winner = "Player 1 Wins!"
                p1WinCount += 1
            } else if rowSum1 == -3 {
                winDetected = true
                winner = "Player 2 Wins!"
                p2WinCount += 1
                }
            }
        }
        
        func columnCheck() {
        for columnIndex in 0..<grid.count {
            var columnSum = 0
            for row in grid {
                columnSum += row[columnIndex]
            }
            if columnSum == 3{
                winDetected = true
                winner = "Player 1 Wins!"
                p1WinCount += 1
            } else if columnSum == -3{
                winDetected = true
                winner = "Player 2 Wins!"
                p2WinCount += 1
                }
            }
        }
        
        func diagonalCheck() {
        if grid[0][0] + grid[1][1] + grid[2][2] == 3 || grid[0][2] + grid[1][1] + grid[2][0] == 3 {
            winDetected = true
            winner = "Player 1 Wins!"
            p1WinCount += 1
        } else if grid[0][0] + grid[1][1] + grid[2][2] == -3 || grid[0][2] + grid[1][1] + grid[2][0] == -3 {
            winDetected = true
            winner = "Player 2 Wins!"
            p2WinCount += 1
            }
        }
    
        func drawCheck() {
            let flattened = grid.flatMap { row in
                return row.filter({ element in return element == 0 })
                
            }
            if flattened.isEmpty {
                draw = true
                winner = "Draw"
            }
        }
        
        rowCheck()
        columnCheck()
        diagonalCheck()
        drawCheck()
    }
    
    func resetWinState() {
        winDetected = false
        draw = false
        winner = ""
    }
}










