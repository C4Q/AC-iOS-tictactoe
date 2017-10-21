//
//  ticTacToeBrain.swift
//  ticTacToe
//
//  Created by C4Q  on 9/29/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import Foundation

class TicTacToeBrain {
    
    var ticTacTocBoard: [[Int]]
    var turnNumber = 1
    private var player1Wins = 0
    private var player2Wins = 0
    
    init() {
        ticTacTocBoard = [[0,0,0],
                          [0,0,0],
                          [0,0,0]]
    }
    
    func turnPlayerChose(playerKey: Int, x: Int, y: Int) {
        turnNumber += 1
        ticTacTocBoard[x][y] = playerKey
    }
    
    func hasPlayer1Won() -> Bool {
        var sumHorizontal = 0
        var sumVertical = 0
        for x in 0..<ticTacTocBoard.count {
            for y in 0..<ticTacTocBoard[x].count {
                sumHorizontal += ticTacTocBoard[x][y]
                sumVertical += ticTacTocBoard[y][x]
            }
            if sumHorizontal == 3 || sumVertical == 3 {
                player1Wins += 1
                resetGame()
                return true
            }
            sumHorizontal = 0
            sumVertical = 0
        }
        if ticTacTocBoard[0][0] + ticTacTocBoard[1][1] + ticTacTocBoard[2][2] == 3 ||
           ticTacTocBoard[0][2] + ticTacTocBoard[1][1] + ticTacTocBoard[2][0] == 3 {
            player1Wins += 1
            resetGame()
            return true
        }
        return false
    }
    
    func hasPlayer2Won() -> Bool {
        var sumHorizontal = 0
        var sumVertical = 0
        for x in 0..<ticTacTocBoard.count {
            for y in 0..<ticTacTocBoard[x].count {
                sumHorizontal += ticTacTocBoard[x][y]
                sumVertical += ticTacTocBoard[y][x]
            }
            if sumHorizontal == -3 || sumVertical == -3 {
                player2Wins += 1
                resetGame()
                return true
            }
            sumHorizontal = 0
            sumVertical = 0
        }
        if ticTacTocBoard[0][0] + ticTacTocBoard[1][1] + ticTacTocBoard[2][2] == -3 ||
            ticTacTocBoard[0][2] + ticTacTocBoard[1][1] + ticTacTocBoard[2][0] == -3 {
            player2Wins += 1
            resetGame()
            return true
        }
        return false
    }
    
    func resetGame() {
        ticTacTocBoard = [[0,0,0],
                          [0,0,0],
                          [0,0,0]]
        turnNumber = 1
    }
    
}
