//
//  ViewController.swift
//  ticTacToe
//
//  Created by C4Q  on 9/27/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    
    @IBOutlet weak var PlayerOneLabel: UILabel!
    @IBOutlet weak var PlayerTwoLabel: UILabel!
    @IBOutlet weak var CurrentTurnLabel: UILabel!
    @IBOutlet weak var CurrentWinnerLabel: UILabel!
    
    private var turnCounter = 0
    var playerOneScore = 0
    var playerTwoScore = 0
    var ticTacArray = [["NA", "NA", "NA"],
                       ["NA", "NA", "NA"],
                       ["NA", "NA", "NA"]]
    
    struct GameStats {
        var turnCounter = 0
        var player1Score = 0
        var player2Score = 0
        
    }
    
    var currentGameStats = GameStats()
    var ticTacModel = ticTacToeBrain()
    
    @IBAction func ticTacButtonPress(_ sender: GameButton) {
        updateCell(sender)
        checkIfWon(letter: ticTacArray)
        CurrentTurnLabel.text = ticTacModel.showCurrentTurn()
        
    }
    
    @IBAction func resetGameButtonPress(_ sender: UIButton) {
        resetGameState()
    }
    
    func updateCell(_ sender: GameButton) {
        
        if ticTacModel.turnCounter % 2 == 0 {
            sender.setBackgroundImage(#imageLiteral(resourceName: "sign-o"), for: .normal)
            ticTacArray[sender.row][sender.column] = "O"
            sender.isEnabled = false
        } else {
            sender.setBackgroundImage(#imageLiteral(resourceName: "sign-x"), for: .normal)
            ticTacArray[sender.row][sender.column] = "X"
            sender.isEnabled = false
        }
        
        ticTacModel.turnCounter += 1
    }
    
    
    func checkIfWon(letter: [[String]]) {
        var diagDown = ""
        var diagUp = ""
        var count = 0
        for i in 0..<letter.count {
            
            //Check rows
            if letter[i].filter({$0 != "X" }).isEmpty || letter[i].filter({$0 != "O" }).isEmpty {
                print("You won")
                endGame()
            }
        }
        
        
        //Check diagnols
        for row in ticTacArray.indices {
            diagDown += ticTacArray[row][row]
        }
        for row in ticTacArray.indices.reversed() {
            diagUp += ticTacArray[row][count]
            count += 1
        }
        
        if diagDown.filter({$0 != "X"}).isEmpty || diagDown.filter({$0 != "O"}).isEmpty {
            print("You won")
            endGame()
        }
        if diagUp.filter({$0 != "X"}).isEmpty || diagUp.filter({$0 != "O"}).isEmpty {
            print("You won")
            endGame()
        }
        
        //Check columns
        for rowNumber in ticTacArray.indices {
            var cellsInCol = ""
            for cellNumber in ticTacArray[rowNumber].indices {
                cellsInCol += ticTacArray[cellNumber][rowNumber]
            }
            if cellsInCol.filter({$0 != "O"}).isEmpty || cellsInCol.filter({$0 != "X"}).isEmpty {
                print("You won col")
                endGame()
            }
        }
        
        if ticTacArray.flatMap({$0}).filter({$0 == "NA"}).isEmpty {
            endGame(false)
        }
        
    }
    
    func switchButtons(toState: Bool) {
        for tagNumber in 0...9 {
            let tempBtn = self.view.viewWithTag(tagNumber) as? UIButton
            tempBtn?.isEnabled = toState
        }
    }
    
    
    func updateScore() {
        if ticTacModel.turnCounter % 2 != 0 {
            currentGameStats.player1Score += 1
            CurrentWinnerLabel.text = "Player One Wins!"
        } else {
            (currentGameStats.player2Score += 1)
            CurrentWinnerLabel.text = "Player Two Wins!"
        }
        PlayerOneLabel.text = String(currentGameStats.player1Score)
        PlayerTwoLabel.text = String(currentGameStats.player2Score)
    }
    
    func endGame(_ wonByPlayer: Bool = true) {
        switchButtons(toState: false)
        CurrentWinnerLabel.isHidden = false
        if wonByPlayer {
            self.view.backgroundColor = UIColor(hue:0.87, saturation:0.44, brightness:0.97, alpha:1.00)
           updateScore()
        } else {
            self.view.backgroundColor = UIColor(hue:0.25, saturation:0.58, brightness:0.96, alpha:1.00)
            CurrentWinnerLabel.text = "No Winner!"
        }
    }
    
    func resetGameState() {
        CurrentWinnerLabel.isHidden = true
        switchButtons(toState: true)
        ticTacModel.turnCounter = 0
        CurrentTurnLabel.text = ticTacModel.showCurrentTurn()
        ticTacArray = [["NA", "NA", "NA"],
                       ["NA", "NA", "NA"],
                       ["NA", "NA", "NA"]]
        
        for tagNumber in 0...9 {
            let tempBtn = self.view.viewWithTag(tagNumber) as? UIButton
            tempBtn?.setBackgroundImage(nil, for: .normal)
        }
        
        self.view.backgroundColor = .white
    }
    
    func showCurrentTurn() {
        CurrentTurnLabel.text = (turnCounter % 2 == 0 ? "O" : "X")
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Execute code here
        showCurrentTurn()
    }
}

