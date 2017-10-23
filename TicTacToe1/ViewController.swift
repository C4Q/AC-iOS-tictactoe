//
//  ViewController.swift
//  TicTacToe1
//
//  Created by C4Q on 10/19/17.
//  Copyright © 2017 C4Q. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    

    
    var gameBoard = TTTBoard()
    
    @IBOutlet var allButtons: [UIButton]!
    @IBOutlet weak var oCounter: UILabel!
    @IBOutlet weak var xCounter: UILabel!
    var winCount = [TTTButtonState: UILabel]()
    @IBOutlet weak var currentPlayer: UILabel!
    @IBOutlet weak var gameOverMssg: UILabel!
    @IBAction func boxClicked(_ sender: UIButton) {
        winCount[.o] = oCounter
        winCount[.x] = xCounter
        let row = sender.superview!.tag
        let column = sender.tag
        gameBoard.chooseBox(row: row, column: column)
        
        sender.setImage(UIImage(named: gameBoard.imageAt(row: row, column: column)), for: .disabled)
        sender.isEnabled = false

        currentPlayer.text = gameBoard.currentState.rawValue.uppercased() + "'s turn"
        guard gameBoard.isOver else {
            return
        }
        currentPlayer.text = ""
        allButtons.forEach{$0.isEnabled = false}
        gameOverMssg.text = gameBoard.gameOverMssg
        
        guard !gameBoard.isDraw else {
            return
        }
        if let currentCount = Int((winCount[gameBoard.winner]?.text!)!) {
            winCount[gameBoard.winner]?.text = String(currentCount + 1)
        }
    }
    
    override func viewDidLoad() {
    super.viewDidLoad()
        currentPlayer.text = gameBoard.currentState.rawValue.uppercased() + "'s turn"
        winCount = [.o: oCounter, .x: xCounter]
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func newGame(_ sender: Any) {
        gameBoard = TTTBoard()
        allButtons.forEach{$0.isEnabled = true
            $0.setImage(UIImage(), for: .disabled)
        }
        currentPlayer.text = gameBoard.currentState.rawValue.uppercased() + "'s turn"
        gameOverMssg.text = ""
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

