//
//  ViewController.swift
//  ticTacToe
//
//  Created by C4Q  on 9/27/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var buttonOne: GameButton!
    @IBOutlet weak var buttonTwo: GameButton!
    @IBOutlet weak var buttonThree: GameButton!
    @IBOutlet weak var buttonFour: GameButton!
    @IBOutlet weak var buttonFive: GameButton!
    @IBOutlet weak var buttonSix: GameButton!
    @IBOutlet weak var buttonSeven: GameButton!
    @IBOutlet weak var buttonEight: GameButton!
    @IBOutlet weak var buttonNine: GameButton!
    @IBOutlet weak var gameBanner: UILabel!
    @IBOutlet weak var playerOneTurn: UILabel!
    @IBOutlet weak var playerTwoTurn: UILabel!
    @IBOutlet weak var playerOneWinCount: UILabel!
    @IBOutlet weak var playerTwoWinCount: UILabel!
    @IBOutlet weak var newGameButton: UIButton!
    
    private var buttons = [GameButton]()
    
    private func setupButtonsCollection() {
        buttons.append(buttonOne)
        buttons.append(buttonTwo)
        buttons.append(buttonThree)
        buttons.append(buttonFour)
        buttons.append(buttonFive)
        buttons.append(buttonSix)
        buttons.append(buttonSeven)
        buttons.append(buttonEight)
        buttons.append(buttonNine)
    }
    
    private func disableAllButtons() {
        for button in buttons {
            button.isEnabled = false
        }
    }
    
    private func enableAllButtons() {
        for button in buttons {
            button.isEnabled = true
        }
    }
    
    private func resetBoard() {
        for button in buttons {
            button.setImage(nil, for: .normal)
        }
    }
    
    @IBAction func newGameButton(_ sender: UIButton) {
        gameBanner.text = "Tic-Tac-Toe"
        playerOneTurn.isHidden = false
        playerTwoTurn.isHidden = true
        playerOneWinCount.isHidden = false
        playerTwoWinCount.isHidden = false
        newGameButton.isHidden = true
        enableAllButtons()
        resetBoard()
        ticTacToe.resetBoard()
        winSearch.resetWinState()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playerOneTurn.isHidden = false
        playerTwoTurn.isHidden = true
        playerOneWinCount.isHidden = true
        playerTwoWinCount.isHidden = true
        newGameButton.isHidden = true
        setupButtonsCollection()
    }
    
    let ticTacToe = TicTacToeBrain()
    var winSearch = WinChecker()
    
    @IBAction func boardButtons(_ sender: GameButton) {
        if ticTacToe.grid[sender.row][sender.column] == 0 {
            ticTacToe.grid[sender.row][sender.column] = ticTacToe.player
            if ticTacToe.player == 1 {
                sender.setImage(#imageLiteral(resourceName: "letter-x"), for: .normal)
                winSearch.check(grid: ticTacToe.grid)
                if winSearch.winDetected == true {
                    gameBanner.text = "\(winSearch.winner) Wins!"
                    playerOneWinCount.isHidden = false
                    playerOneWinCount.text = "P1 Wins: \(winSearch.p1WinCount)"
                    playerTwoWinCount.isHidden = false
                    playerTwoWinCount.text = "P2 Wins: \(winSearch.p2WinCount)"
                    newGameButton.isHidden = false
                    disableAllButtons()
                } else {
                playerOneTurn.isHidden = true
                playerTwoTurn.isHidden = false
                }
            } else {
                sender.setImage(#imageLiteral(resourceName: "letter-o"), for: .normal)
                winSearch.check(grid: ticTacToe.grid)
                if winSearch.winDetected == true {
                    gameBanner.text = "\(winSearch.winner) Wins!"
                    playerOneWinCount.isHidden = false
                    playerOneWinCount.text = "P1 Wins: \(winSearch.p1WinCount)"
                    playerTwoWinCount.isHidden = false
                    playerTwoWinCount.text = "P2 Wins: \(winSearch.p2WinCount)"
                    newGameButton.isHidden = false
                    disableAllButtons()
                } else {
                playerOneTurn.isHidden = false
                playerTwoTurn.isHidden = true
                }
            }
            ticTacToe.switchPlayer()
            
        }
        
        if winSearch.draw {
            gameBanner.text = "Draw!"
            playerOneWinCount.isHidden = false
            playerOneWinCount.text = "P1 Wins: \(winSearch.p1WinCount)"
            playerTwoWinCount.isHidden = false
            playerTwoWinCount.text = "P2 Wins: \(winSearch.p2WinCount)"
            newGameButton.isHidden = false
            disableAllButtons()
        }
    }
}

