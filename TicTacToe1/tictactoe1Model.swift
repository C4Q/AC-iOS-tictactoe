//
//  tictactoe1Model.swift
//  TicTacToe1
//
//  Created by C4Q on 10/19/17.
//  Copyright © 2017 C4Q. All rights reserved.
//

import Foundation
//import UIKit

enum TTTButtonState: String {
    case o
    case x
    case nulli
}

class TTTButton {
    var currentState: TTTButtonState
    init(currentState: TTTButtonState = .nulli) {
        self.currentState = currentState
    }

}
class TTTBoard {
    let leButtons: [[TTTButton]] = [[TTTButton(),TTTButton(),TTTButton()],[TTTButton(),TTTButton(),TTTButton()],[TTTButton(),TTTButton(),TTTButton()]]
    var leButtonsInv: [[TTTButton]] {
        return [leButtons.map{$0[0]},
                leButtons.map{$0[1]},
                leButtons.map{$0[2]}]
    }
    var gameOverMssg: String {
        if isDraw {
            return "Draw"
        }
        return winner.rawValue.uppercased() + " wins"
    }
    var isOver = false
    var isDraw = false
    var currentState = TTTButtonState.o
    var winner = TTTButtonState.nulli
    
    func chooseBox(row: Int, column: Int) {

        leButtons[row][column].currentState = currentState
        
        isOver = isFull() || hasWinner()
        isDraw = isFull() && !hasWinner()
        
        if isOver && !isDraw {
            winner = currentState
        }
        
        currentState = (currentState == .o ? .x : .o)
    }
    
    func isFull() -> Bool {
        return !(leButtons[0] + leButtons[1] + leButtons[2]).map{$0.currentState}.contains(.nulli)
    }
    func hasWinner() -> Bool {
        let horCheck = leButtons.reduce(false){prevBool, arr in
            let arrAsSet = Set(arr.map{$0.currentState.rawValue})
            return prevBool || (arrAsSet.count == 1 && !arrAsSet.contains("nulli"))
        }
        let verCheck = leButtonsInv.reduce(false){(prevBool: Bool, arr: [TTTButton]) in
            let arrAsSet = Set(arr.map{$0.currentState.rawValue})
            return prevBool || arrAsSet.count == 1 && !arrAsSet.contains("nulli")
        }
        let diaCheck = (leButtons[0][0].currentState == leButtons[1][1].currentState &&
            leButtons[1][1].currentState == leButtons[2][2].currentState ||
            leButtons[2][0].currentState == leButtons[1][1].currentState &&
            leButtons[1][1].currentState == leButtons[0][2].currentState) &&
            leButtons[1][1].currentState != .nulli
        return horCheck || verCheck || diaCheck
    }
    
    func imageAt(row: Int, column: Int) -> String {
        return leButtons[row][column].currentState.rawValue
    }
    
}

