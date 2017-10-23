//
//  ticTacToeBrain.swift
//  ticTacToe
//
//  Created by C4Q  on 9/29/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import Foundation
import UIKit




class ticTacToeBrain {
    
    // enum with raw value of string to hold player turn text
    enum playerTurn: String {
        case one = "Player One's Turn.  Place an X"
        case two = "Player Two's Turn.  Place an O"
    }
    let turn1 = playerTurn.one
    let turn2 = playerTurn.two
    
    // create the start matrix to begin the game and to reset the game
    let startMatrix = [["0","1","2"],
                       ["3","4","5"],
                       ["6","7","8"]]
    
    
    
    // Function to check win conditions
    func isThereAWinner(ticTacToeMatrix: [[String]]) -> (String, Bool) {
        let flatMatrix = ticTacToeMatrix.flatMap { $0 }
        // row 1
        if flatMatrix[0] == flatMatrix[1] && flatMatrix[0] == flatMatrix[2] {
            return (flatMatrix[0], true)
        // row 2
        } else if flatMatrix[3] == flatMatrix[4] && flatMatrix[3] == flatMatrix[5] {
            return (flatMatrix[3], true)
        // row 3
        } else if flatMatrix[6] == flatMatrix[7] && flatMatrix[6] == flatMatrix[8] {
            return (flatMatrix[6], true)
        // column 1
        } else if flatMatrix[0] == flatMatrix[3] && flatMatrix[0] == flatMatrix[6] {
            return (flatMatrix[0], true)
        // column 2
        } else if flatMatrix[1] == flatMatrix[4] && flatMatrix[1] == flatMatrix[7] {
            return (flatMatrix[1], true)
        // column 3
        } else if flatMatrix[2] == flatMatrix[5] && flatMatrix[2] == flatMatrix[8] {
            return (flatMatrix[2], true)
        // diagonal
        } else if flatMatrix[0] == flatMatrix[4] && flatMatrix[0] == flatMatrix[8] {
            return (flatMatrix[0], true)
        // diagonal
        } else if flatMatrix[2] == flatMatrix[4] && flatMatrix[2] == flatMatrix[6] {
            return (flatMatrix[2], true)
        // any other combo
        } else {
            var allFilledIn = true
            for i in flatMatrix {
                if i != "X" && i != "O" {
                    allFilledIn = false
                }
            }
            if allFilledIn == true {
                return ("D", false)
            } else {
                return (" ", false)
            }
        }
    }
    

}
