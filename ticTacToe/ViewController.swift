//
//  ViewController.swift
//  ticTacToe
//
//  Created by C4Q  on 9/27/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var gameButtons: [UIButton]!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var xWinTally: UILabel!
    @IBOutlet weak var oWinTally: UILabel!
    @IBOutlet weak var newGameButton: UIButton!
    
    var game = ticTacToeBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        game = ticTacToeBrain()
        messageLabel.text = game.gameStatus.rawValue
        xWinTally.text = String(game.winningTally.xWins.hashValue)
        oWinTally.text = String(game.winningTally.oWins.hashValue)
    }
    
    @IBAction func newGame(_ sender: UIButton) {
        newGameButton.isHidden = true
        game.resetGame()
        updateGame()
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        let button = sender as UIButton
        game.updateCurrentBoard(index: button.tag)
        updateGame()
        if game.gameStatus == .xVictorious || game.gameStatus == .oVictorious || game.gameStatus == .tie  {
            newGameButton.isHidden = false
        }
    }
    
    func updateGame(){
        xWinTally.text = String(game.winningTally.xWins.hashValue)
        oWinTally.text = String(game.winningTally.oWins.hashValue)
        messageLabel.text = game.gameStatus.rawValue
        
        for button in gameButtons {
            switch game.currentBoard[button.tag] {
            case .none:
                button.setImage(nil, for: .normal)
            case .x:
                button.setImage(#imageLiteral(resourceName: "bones3"), for: .normal)
            case .o:
                button.setImage(#imageLiteral(resourceName: "skull2"), for: .normal)
                
            }
        }
    }
}


