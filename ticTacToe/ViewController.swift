//
//  ViewController.swift
//  ticTacToe
//
//  Created by C4Q  on 9/27/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

//made to be played in iPhone 6s

class ViewController: UIViewController {
    
    @IBOutlet weak var gameTitle: UILabel!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var gameGrid: UILabel!
    @IBOutlet weak var myNameLabel: UILabel!
    @IBOutlet weak var player1Label: UILabel!
    @IBOutlet weak var player2Label: UILabel!
    @IBOutlet weak var player1O: UILabel!
    @IBOutlet weak var player2X: UILabel!
    @IBOutlet weak var player1Score: UILabel!
    @IBOutlet weak var player2Score: UILabel!
    @IBOutlet var gridButtons: [GameButton]!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var playAgainButton: UIButton!
    
    var ticTacToe = ticTacToeBrain()
    
    var gameItems: [UILabel] = []
    
    override func viewDidLoad() {
        showTitleScreen()
        hideGame()
        gameItems += [gameGrid, resultLabel, player1Label, player2Label, player1O, player2X, player1Score, player2Score]
        super.viewDidLoad()
    }
    
    @IBAction func gridButtonPressed(_ sender: GameButton) {
        if ticTacToe.playerTurn == .one {
            sender.setBackgroundImage(#imageLiteral(resourceName: "grid x"), for: .normal)
            ticTacToe.board[sender.row][sender.column] = .x
            resultLabel.text = "Player 2's Turn"
        } else {
            sender.setBackgroundImage(#imageLiteral(resourceName: "grid o"), for: .normal)
            ticTacToe.board[sender.row][sender.column] = .o
            resultLabel.text = "Player 1's Turn"
        }
        sender.isEnabled = false
        ticTacToe.checkForWin()
        if ticTacToe.win {
            endGame()
            resultLabel.text = "Congrats Player \(ticTacToe.playerTurn.rawValue)!"
            
            return
        } else if ticTacToe.moveCount == 9 {
            endGame()
            resultLabel.text = "It was a tie!"
            return
        }
        ticTacToe.playerTurn.changeTurn()
    }
    
    @IBAction func playButtonPressed(_ sender: UIButton) {
        startGame()
        hideTitleScreen()
        displayPlayerScore()
    }
    
    @IBAction func playAgainButtonPressed(_ sender: UIButton) {
        ticTacToe.resetGame()
        playAgainButton.isHidden = true
        resultLabel.isHidden = true
        startGame()
        displayPlayerScore()
    }
    
    func showTitleScreen() {
        roundEdgesOf(label: gameTitle)
        roundEdgesOf(label: myNameLabel)
        roundEdgesOf(button: playButton)
        gameTitle.isHidden = false
        myNameLabel.isHidden = false
        playButton.isHidden = false
        playButton.isEnabled = true
    }
    
    func hideTitleScreen() {
        gameTitle.isHidden = true
        playButton.isHidden = true
        myNameLabel.isHidden = true
    }
    
    func hideGame() {
        gameItems.forEach{$0.isHidden = true}
        resultLabel.isHidden = true
        playAgainButton.isHidden = true
    }
    
    func startGame() {
        gameItems.forEach{
            roundEdgesOf(label: $0)
            if $0 == resultLabel {
                $0.text = "Player 1's Turn"
            }
            $0.isHidden = false
        }
        gridButtons.forEach{
            roundEdgesOf(gameButton: $0)
            $0.isHidden = false
            $0.setBackgroundImage(nil, for: .normal)
            $0.isEnabled = true
        }
    }
    
    func endGame() {
        gridButtons.forEach{$0.isEnabled = false}
        resultLabel.isHidden = false
        playAgainButton.isHidden = false
        roundEdgesOf(button: playAgainButton)
        displayPlayerScore()
    }
    
    func displayPlayerScore() {
        ticTacToe.updatePlayerScores()
        player1Score.text = "\(ticTacToe.player1Score)"
        player2Score.text = "\(ticTacToe.player2Score)"
        player1Score.isHidden = false
        player2Score.isHidden = false
    }
    
    //not necessary, just used to make my app pretty 😂
    func roundEdgesOf(label: UILabel? = nil, button: UIButton? = nil, gameButton: GameButton? = nil) {
        var notRoundItems: [Any] = []
        if let label = label {
            notRoundItems.append(label)
        }
        if let button = button {
            notRoundItems.append(button)
        }
        if let gameButton = gameButton {
            notRoundItems.append(gameButton)
        }
        notRoundItems.forEach{
            if !($0 is GameButton) {
                ($0 as AnyObject).layer.borderWidth = 1
                ($0 as AnyObject).layer.borderColor = UIColor.init(red: 0.745, green: 0.278, blue: 0.309, alpha: 1).cgColor
            }
            ($0 as AnyObject).layer.cornerRadius = 20
            ($0 as AnyObject).layer.masksToBounds = true
            ($0 as AnyObject).layer.backgroundColor = UIColor.white.cgColor
        }
    }
}

