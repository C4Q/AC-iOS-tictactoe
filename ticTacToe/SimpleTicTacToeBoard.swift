//
//  SimpleTicTacToeBoard.swift
//  ticTacToe
//
//  Created by Luis Calle on 10/21/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import Foundation

class SimpleTicTacToeBoard {
    private var ticTacTocBoard: [[Int]] = [[0,0,0],
                                           [0,0,0],
                                           [0,0,0]]
    
    func fillSpace(playerKey: Int, row: Int, col: Int) {
        ticTacTocBoard[row][col] = playerKey
    }
    
    func getValueInBoard(row: Int, col: Int) -> Int {
        return ticTacTocBoard[row][col]
    }
    
    func resetSimpleBoard() {
        ticTacTocBoard = [[0,0,0],
                          [0,0,0],
                          [0,0,0]]
    }
    
    func boardLength() -> Int {
        return ticTacTocBoard.count
    }
}
