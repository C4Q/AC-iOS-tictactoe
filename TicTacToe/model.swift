//  Model.swift
//  TicTacToe
//  Created by C4Q on 10/24/17.
//  Copyright © 2017 Winston Maragh. All rights reserved.

import Foundation
import UIKit

class Model {
	var winningCombos:[Set<Int>] = [[1,2,3], [4,5,6], [7,8,9], [1,4,7], [2,5,8], [3,6,9], [1,5,9], [3,5,7]]
	var playerOneChoices = [Int]()
	var playerTwoChoices = [Int]()
	var playerWon: Bool = false
	var winnerText: String = ""
	var boardMoves = 0
	
	func resetModel() {
		playerOneChoices = []
		playerTwoChoices = []
		playerWon = false
		winnerText = ""
		boardMoves = 0
	}
	
	func checkWin() {
		for nums in winningCombos {
			if nums.isSubset(of: playerOneChoices) {
				playerWon = true
				winnerText = "Player 1 wins!"
				return
			} else if nums.isSubset(of: playerTwoChoices) {
				playerWon = true
				winnerText = "Player 2 wins!"
				return
			} else if boardMoves == 9 && playerWon == false {
				winnerText = "Draw!"
				return
			}
		}
	}
	
	/*
	func AIplayer() {
	AI logic (has 4 moves)
	
	NESTED 1 - AI 1st move:
	-if human plays the corners (1,3,7,9), AI plays center (5)
	AI 2nd move:
	
	
	-if human plays center, AI plays left corner (1)
	AI 2nd move:
	
	
	-if human plays 2 - AI play 1 (left of it)
	AI 2nd move:
	
	
	-if human plays 4, AI play 1 (top of it)
	AI 2nd move:
	
	
	
	-if human plays 6, AI play 3 (top of it)
	AI 2nd move:
	
	
	
	-if human plays 8, AI play 7 (left of it)
	AI 2nd move:
	}
	*/
	
}



