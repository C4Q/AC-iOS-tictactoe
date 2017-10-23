//
//  ticTacToeBrain.swift
//  ticTacToe
//
//  Created by C4Q  on 9/29/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import Foundation

class ticTacToeBrain {
    
}


// Players

enum Players {
    case playerOne
    case playerTwo
}




//// Wins
//
//class Wins: GameButton {
//    let horizontal0 = [(0,0),(0,1),(0,2)]
//    let horizontal1 = [(1,0),(1,1),(1,2)]
//    let horizontal3 = [(2,0),(2,1),(2,2)]
//    let verticle1 = [(0,0),(1,0),(2,0)]
//    let verticle2 = [(0,1),(1,1),(2,1)]
//    let verticle3 = [(0,2),(1,2),(2,2)]
//    let diagonal1 = [(0,0),(1,1),(2,2)]
//    let diagonal2 = [(0,2),(1,1),(2,0)]
//}




// Player var
var player = 1

// Turn var
var turn = 0

// Win Bool
var xWin = false
var oWin = false

// Win Arr

var horizontal1 = [String]()
var horizontal2 = [String]()
var horizontal3 = [String]()
var verticle1 = [String]()
var verticle2 = [String]()
var verticle3 = [String]()
var diagonal1 = [String]()
var diagonal2 = [String]()

// Win counter
var xWinCounter = 0
var oWinCounter = 0 



