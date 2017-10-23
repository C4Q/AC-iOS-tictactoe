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
    var char = "O"
    func setTitleText () -> String {
        switch char {
        case "X":
            char = "O"
        default:
            char = "X"
        }
        return char
    }
    var setOfOne = Set<GameButton>()
    var setOfTwo = Set<GameButton>()
    func setOfPlayer(button: GameButton) {
        switch char {
        case "X":
            setOfOne.insert(button)
        default:
            setOfTwo.insert(button)
        }
    }
    
    var winBool = false
    func setUpGame() {
        char = "O"
        setOfOne = Set<GameButton>()
        setOfTwo = Set<GameButton>()
        winBool = false
    }
    
    var countOne = 0
    var countTwo = 0
    func addCountOne() {
        countOne += 1
    }
    func addCountTwo() {
        countTwo += 1
    }
  
}







