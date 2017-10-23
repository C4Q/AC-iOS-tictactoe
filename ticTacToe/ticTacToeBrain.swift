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
    
    
    
    var turnCounter = 0
    
    
    func showCurrentTurn() -> String {
        return  (turnCounter % 2 == 0 ? "O" : "X")
        
    }
    
}

