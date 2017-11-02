//
//  ticTacToeBrain.swift
//  ticTacToe
//
//  Created by C4Q  on 9/29/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import Foundation



class ticTacToeBrain {
    private enum Cell {
        case x
        case o
        case empty
    }
    private var gameStateArray:[[Cell]] = [[.empty , .empty , .empty],
                                           [.empty , .empty , .empty],
                                           [.empty , .empty , .empty]]
    enum Player {
        case One
        case Two
    }
    
    var GameIsActive: Bool = true
    private var playerToken = Cell.empty
    var activePlayer = Player.One

    
    // this func gets pressed button coordinates & prints a display message if the game is active
    func userButtonPressedInput(row: Int, column: Int) -> String {
        var displaMessage = ""
        if gameStateArray[row][column] == .empty && GameIsActive == true {
            displaMessage = displayMessage(row: row, column: column)
        }
        return displaMessage
     }
    // reset Game func
    func boardReset() {
        GameIsActive = true
        for row in 0..<gameStateArray.count {
            for cellToBeReset in 0..<gameStateArray[row].count {
                gameStateArray[row][cellToBeReset] = Cell.empty
            }
        }
    }
    
    //this the main func checks wins and returns a string to be printed on a label
    
    private func displayMessage(row: Int, column: Int) -> String {
        var displayMessage = ""
        switch playerToken {
        case .empty:
            playerToken = .x
            activePlayer = .One
            displayMessage = "player \(Player.Two)'s turn"
        case .x:
            playerToken = .o
            activePlayer = .Two
            displayMessage = "player \(Player.One)'s turn"
        case .o:
            playerToken = .x
            activePlayer = .One
            displayMessage = "player \(Player.Two)'s turn"
        }
        gameStateArray[row][column] = playerToken
        
        switch checkWinningRowAndColumn(pressedRow: row, pressedColumn: column) {
        case true:
            displayMessage = "Player \(activePlayer) Wins this Game"
             GameIsActive = false
        case false:
            break
        }
        switch checkDiagonalWin(pressedRow: row, pressedColumn: column) {
        case true:
            displayMessage = "Player \(activePlayer) Wins this Game"
            GameIsActive = false
        case false:
            break
        }
        return displayMessage
    }
    
    
    
    
    //this func checks for row or column win at the pressed button
    private func checkWinningRowAndColumn(pressedRow: Int, pressedColumn: Int) -> Bool {
        var rowBool = true
        var columnBool = true
            // check
        for column in 0..<gameStateArray[pressedRow].count {
            if gameStateArray[pressedRow][column] != gameStateArray[pressedRow][pressedColumn] {
                rowBool = false
                break
            }
        }
        for row in 0..<gameStateArray[pressedColumn].count {
            if gameStateArray[row][pressedColumn] != gameStateArray[pressedRow][pressedColumn] {
                columnBool = false
                break
            }
        }
        if rowBool == true || columnBool == true {
            return true
        } else{
            return false
        }
    }

    //this func checks diagonal win
    private func checkDiagonalWin(pressedRow: Int, pressedColumn: Int) -> Bool {
        var oppositeDiagonalBool = true
        var diagnoalBool = true
        var step = 0
        //
        for row in 0..<gameStateArray.count {
            if gameStateArray[row][step] != gameStateArray[pressedRow][pressedColumn] {
                diagnoalBool = false
                break
            }
            step += 1
        }
        var backwardStep = gameStateArray.count - 1
        for row in 0..<gameStateArray.count {
            if gameStateArray[row][backwardStep] != gameStateArray[pressedRow][pressedColumn] {
                oppositeDiagonalBool = false
                break
            }
            backwardStep -= 1
        }
        if diagnoalBool == true || oppositeDiagonalBool == true {
            return true
        } else{
            return false
        }
    }
}











