//
//  ViewController.swift
//  ticTacToe
//
//  Created by C4Q  on 9/27/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var gameTitle: UILabel!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var gameGrid: UIImageView!
    @IBOutlet weak var myNameLabel: UILabel!
    @IBOutlet weak var player1Label: UILabel!
    @IBOutlet weak var player2Label: UILabel!
    @IBOutlet weak var player1O: UIImageView!
    @IBOutlet weak var player2X: UIImageView!
    @IBOutlet var gridButtons: [GameButton]!
    @IBOutlet weak var gameResultLabel: UILabel!
    
    var ticTacToe = ticTacToeBrain()
    
    override func viewDidLoad() {
        showTitleScreen()
        hideGame()
        super.viewDidLoad()
    }
    
    
    @IBAction func gridButtonPressed(_ sender: GameButton) {
        if ticTacToe.playerTurn == 1 {
            sender.setBackgroundImage(#imageLiteral(resourceName: "grid o"), for: .normal)
            ticTacToe.gameMatrix[sender.row][sender.column] = "O"
        } else {
            sender.setBackgroundImage(#imageLiteral(resourceName: "grid x"), for: .normal)
            ticTacToe.gameMatrix[sender.row][sender.column] = "X"
        }
        sender.isEnabled = false
        ticTacToe.checkForWin()
        if ticTacToe.win {
            endGame()
            gameResultLabel.text = "Congrats Player \(ticTacToe.playerTurn)!"
            return
        } else if ticTacToe.tie {
            endGame()
            gameResultLabel.text = "It was a tie!"
            return
        }
        ticTacToe.changePlayerTurn()
    }
//        if ticTacToe.tie {
//            //if there was a tie
//            endGame()
//            gameResultLabel.text = "It was a tie!"
//        }
//        case true:
//            //someone won
//            endGame()
//            gameResultLabel.text = "Congrats Player \(ticTacToe.playerTurn)!"
//        }
    
    @IBAction func playButtonPressed(_ sender: UIButton) {
        startGame()
    }
    
    func showTitleScreen() {
        gameTitle.isHidden = false
        gameTitle.layer.cornerRadius = 30
        gameTitle.layer.masksToBounds = true
        gameTitle.layer.backgroundColor = UIColor.white.cgColor
        playButton.isHidden = false
        playButton.layer.cornerRadius = 30
        playButton.layer.masksToBounds = true
        playButton.layer.backgroundColor = UIColor.white.cgColor
        myNameLabel.isHidden = false
        myNameLabel.layer.cornerRadius = 30
        myNameLabel.layer.masksToBounds = true
        myNameLabel.layer.backgroundColor = UIColor.white.cgColor
    }
    
    func hideTitleScreen() {
        gameTitle.isHidden = true
        playButton.isHidden = true
        myNameLabel.isHidden = true
    }
    
    func hideGame() {
        gameGrid.isHidden = true
        player1Label.isHidden = true
        player2Label.isHidden = true
        player1O.isHidden = true
        player2X.isHidden = true
        gameResultLabel.isHidden = true
    }
    
    func startGame() { //use this when player clicks play
        gameGrid.isHidden = false
        gameGrid.layer.cornerRadius = 20
        gameGrid.layer.masksToBounds = true
        gameGrid.layer.backgroundColor = UIColor.white.cgColor
        player1Label.isHidden = false
        player1Label.layer.cornerRadius = 30
        player1Label.layer.masksToBounds = true
        player1Label.layer.backgroundColor = UIColor.white.cgColor
        player2Label.isHidden = false
        player2Label.layer.cornerRadius = 30
        player2Label.layer.masksToBounds = true
        player2Label.layer.backgroundColor = UIColor.white.cgColor
        player1O.isHidden = false
        player1O.layer.cornerRadius = 30
        player1O.layer.masksToBounds = true
        player1O.layer.backgroundColor = UIColor.white.cgColor
        player2X.isHidden = false
        player2X.layer.cornerRadius = 30
        player2X.layer.masksToBounds = true
        player2X.layer.backgroundColor = UIColor.white.cgColor
        gridButtons.forEach{$0.setBackgroundImage(nil, for: .normal)}
    }
    
    func endGame() {
        //stuff that happens when player 1 or 2 wins/loses
        gridButtons.forEach{$0.isEnabled = false}
        gameResultLabel.isHidden = false
    }
    
}

