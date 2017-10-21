//
//  ticTacToeBrain.swift
//  ticTacToe
//
//  Created by C4Q  on 9/29/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import Foundation

class ticTacToeBrain { //the model
    enum PlayerTurn: Int {
        case one = 1
        case two = 2
        
        mutating func changeTurn() {
            (self == .one) ? (self = .two) : (self = .one)
        }
    }
    
    enum GameBoard: String {
        case x = "X"
        case o = "O"
        case blank = ""
    }
    
    var win = false
    var moveCount = 0
    var playerTurn: PlayerTurn = .one
    var player1Score = 0
    var player2Score = 0 //if reaches 9, tie = true
    var board: [[GameBoard]] = [[.blank, .blank, .blank],
                                [.blank, .blank, .blank],
                                [.blank, .blank, .blank]]
    
    func checkForWin() {
        for number in 0..<board.count {
            //horizontal win
            if board[number][0] != .blank && board[number][0] == board[number][1] && board[number][1] == board[number][2] {
                win = true
            } else if board[0][number] != .blank && board[0][number] == board[1][number] && board[1][number] == board[2][number] {
                //vertical win
                win = true
            } else if board[0][0] != .blank && board[0][0] == board[1][1] && board[1][1] == board[2][2] {
                //diagonal 1 win
                win = true
            } else if board[2][0] != .blank && board[2][0] == board[1][1] && board[1][1] == board[0][2] { //diagonal 2 win
                win = true
            }
        }
        moveCount += 1
    }
    
    func updatePlayerScores() {
        if win {
            (playerTurn == .one) ? (player1Score += 1) : (player2Score += 1)
        }
    }
    
    func resetGame() {
        win = false
        playerTurn = .one
        board = [[.blank, .blank, .blank],
                 [.blank, .blank, .blank],
                 [.blank, .blank, .blank]]
    }
}
