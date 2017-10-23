//
//  ticTacToeBrain.swift
//  ticTacToe
//
//  Created by C4Q  on 9/29/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import Foundation

class ticTacToeBrain {
    
    enum PlayerSymbols: String {
        case none = ""
        case x = "x"
        case o = "o"
    }
    
    enum GameStatus: String {
        case xsTurn = "Your move, X."
        case osTurn = "Your move, O."
        case tie = "It's a draw!"
        case xVictorious = "X wins!"
        case oVictorious = "O wins!"
    }
    
    struct WinningStreak {
        var xWins = 0
        var oWins = 0
        mutating func incrementer(player: String){
            if player == "x" {
                return xWins += 1
            } else if player == "o" {
                return oWins += 1
            }
        }
    }
    
    var winningTally = WinningStreak()
    var gameStatus: GameStatus
    var currentBoard: [PlayerSymbols] = []
    var possibleWins = [[0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 4, 8], [6, 4, 2]]
    
    init() {
        currentBoard = [PlayerSymbols](repeating: .none, count: 9)
        gameStatus = .xsTurn
    }
    
    func updateCurrentBoard(index: Int){
        if currentBoard[index] != .none {
            return
        }
        if gameStatus == .xsTurn {
            currentBoard[index] = .x
            gameStatus = .osTurn
            GameOVerChecker()
        }
        else if gameStatus == .osTurn {
            currentBoard[index] = .o
            gameStatus = .xsTurn
            GameOVerChecker()
        }
    }
    
    func GameOVerChecker(){
        for winningCombos in possibleWins {
            if currentBoard[winningCombos[0]] != .none  && currentBoard[winningCombos[0]] == .x && currentBoard[winningCombos[1]] == .x && currentBoard[winningCombos[2]] == .x {
                gameStatus = .xVictorious
                winningTally.incrementer(player: "x")
            }
            if currentBoard[winningCombos[0]] != .none && currentBoard[winningCombos[0]] == .o && currentBoard[winningCombos[1]] == .o && currentBoard[winningCombos[2]] == .o {
                gameStatus = .oVictorious
                winningTally.incrementer(player: "o")
            }
            else if !currentBoard.contains(.none) {
                gameStatus = .tie
            }
            
        }
    }
    
    func resetGame(){
        currentBoard = [PlayerSymbols](repeating: .none, count: 9)
        gameStatus = .xsTurn
    }
}
