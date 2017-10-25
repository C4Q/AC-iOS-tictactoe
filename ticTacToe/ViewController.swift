//  ViewController.swift
//  TicTacToe
//  Created by C4Q on 10/16/17.
//  Copyright © 2017 Winston Maragh. All rights reserved.

import UIKit

class ViewController: UIViewController {
	var boardSpots: [UIButton] = []
	var winningCombos:[Set<Int>] = [[1,2,3], [4,5,6], [7,8,9], [1,4,7], [2,5,8], [3,6,9], [1,5,9], [3,5,7]]
	var playerOneChoices = [Int]()
	var playerTwoChoices = [Int]()
//	var playerOneMatch = 0
//	var playerTwoMatch = 0
	var boardMoves = 0
	var currentPlayer: Int = 1 //starts game at player 1
	 
	@IBOutlet weak var topLeft: UIButton!
	@IBOutlet weak var topMid: UIButton!
	@IBOutlet weak var topRight: UIButton!
	@IBOutlet weak var midLeft: UIButton!
	@IBOutlet weak var midMid: UIButton!
	@IBOutlet weak var midRight: UIButton!
	@IBOutlet weak var bottomLeft: UIButton!
	@IBOutlet weak var bottomMid: UIButton!
	@IBOutlet weak var bottomRight: UIButton!
	@IBOutlet weak var playerWins: UILabel!
	@IBOutlet weak var changeTextPlayRestart: UIButton!
	
	override func viewDidLoad() {
		super.viewDidLoad() //put this first always
		self.boardSpots = [topLeft, topMid, topRight, midLeft, midMid, midRight, bottomLeft, bottomMid, bottomRight]
	}
	
	func resetBoard() {
		for spot in boardSpots {
			spot.setImage(nil, for: .normal)
			spot.isEnabled = true
		}
		playerOneChoices = []
		playerTwoChoices = []
		boardMoves = 0
		
	}
	func disableBoard() {
		for spot in boardSpots {
			spot.isEnabled = false
		}
	}
	
	@IBAction func playGame(_ sender: UIButton) {
		playerWins.isHidden = true
		playerWins.text = "Player # wins!"
		resetBoard()
		currentPlayer = 1
	}
	
	@IBAction func selectSpot(_ sender: UIButton) {
		if currentPlayer == 1 {
			sender.setImage(#imageLiteral(resourceName: "boardX"), for: .normal)
//			sender.isEnabled = false
			playerOneChoices.append(sender.tag)
			boardMoves += 1
			currentPlayer = 2 //change current player
		} else {
			sender.setImage(#imageLiteral(resourceName: "boardO"), for: .normal)
//			sender.isEnabled = false
			playerTwoChoices.append(sender.tag)
			boardMoves += 1
			currentPlayer = 1  //change current player
		}
		
		for nums in winningCombos {
			if nums.isSubset(of: playerOneChoices) {
				playerWins.text = "Player 1 wins!"
				playerWins.isHidden = false
				disableBoard()
			}
			if nums.isSubset(of: playerTwoChoices) {
				playerWins.text = "Player 2 wins!"
				playerWins.isHidden = false
				disableBoard()
			}
			if boardMoves == 9 {
				playerWins.text = "No One Wins."
				playerWins.isHidden = false
				disableBoard()
				
			}
		}
	} //end func selectSpot
} //end viewController

