//
//  ticTacToeBrain.swift
//  ticTacToe
//
//  Created by C4Q  on 9/29/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import Foundation

enum PlayerKey: Int {
    case player1 = 1
    case player2 = -1
}

class TicTacToeBrain {
    private var simpleBoard = SimpleTicTacToeBoard()
    private var turnNumber = 1
    private var player1Wins = 0
    private var player2Wins = 0
    
    func turnPlayerChose(playerKey: PlayerKey, row: Int, col: Int) {
        turnNumber += 1
        simpleBoard.fillSpace(playerKey: playerKey.rawValue, row: row, col: col)
    }
    
    func hasPlayer1Won() -> Bool {
        var sumHorizontal = 0
        var sumVertical = 0
        var sumDiag1 = 0
        var sumDiag2 = 0
        for row in 0..<simpleBoard.boardLength() {
            for col in 0..<simpleBoard.boardLength() {
                sumHorizontal += simpleBoard.getValueInBoard(row: row, col: col)
                sumVertical += simpleBoard.getValueInBoard(row: col, col: row)
                if row == col {
                    sumDiag1 += simpleBoard.getValueInBoard(row: row, col: col)
                }
                if row + col == 2 {
                    sumDiag2 += simpleBoard.getValueInBoard(row: row, col: col)
                }
            }
            if sumHorizontal == 3 || sumVertical == 3 {
                player1Wins += 1
                resetGame()
                return true
            }
            sumHorizontal = 0
            sumVertical = 0
        }
        if sumDiag1 == 3 || sumDiag2 == 3 {
            player1Wins += 1
            resetGame()
            return true
        }
        return false
    }
    
    func hasPlayer2Won() -> Bool {
        var sumHorizontal = 0
        var sumVertical = 0
        var sumDiag1 = 0
        var sumDiag2 = 0
        for row in 0..<simpleBoard.boardLength() {
            for col in 0..<simpleBoard.boardLength() {
                sumHorizontal += simpleBoard.getValueInBoard(row: row, col: col)
                sumVertical += simpleBoard.getValueInBoard(row: col, col: row)
                if row == col {
                    sumDiag1 += simpleBoard.getValueInBoard(row: row, col: col)
                }
                if row + col == 2 {
                    sumDiag2 += simpleBoard.getValueInBoard(row: row, col: col)
                }
            }
            if sumHorizontal == -3 || sumVertical == -3 {
                player2Wins += 1
                resetGame()
                return true
            }
            sumHorizontal = 0
            sumVertical = 0
        }
        if sumDiag1 == -3 || sumDiag2 == -3 {
            player2Wins += 1
            resetGame()
            return true
        }
        return false
    }
    
    func resetGame() {
        simpleBoard.resetSimpleBoard()
        turnNumber = 1
    }
    
    func currentTurnNumber() -> Int {
        return turnNumber
    }
    
    func totalPlayer1Wins() -> Int {
        return player1Wins
    }
    
    func totalPlayer2Wins() -> Int {
        return player2Wins
    }
}
