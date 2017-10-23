//
//  ViewController.swift
//  ticTacToe
//
//  Created by Tyler Zhao on 10/21/2017.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        resetGame()
    }
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var whosTurnLabel: UILabel!
    @IBOutlet weak var xsScore: UILabel!
    @IBOutlet weak var osScore: UILabel!
    
    @IBAction func gameButtonPressed(_ sender: UIButton) {
        
        //Checks to see if there's a spot in the array that's 0
        if ticTacToeArr[sender.tag - 1] == 0 {
            
            //updates the 0 in the array to currentPlayer number
            ticTacToeArr[sender.tag - 1] = currentPlayer
            
            if currentPlayer == 1 {
                sender.setImage(UIImage(named: "Cross.png"), for: UIControlState())
                whosTurnLabel.text = "O's Turn"
                currentPlayer = 2
            }
            else {
                sender.setImage(UIImage(named: "Nought.png"), for: UIControlState())
                currentPlayer = 1
                whosTurnLabel.text = "X's Turn"
            }
        }
        checkCombo()
    }
    
    @IBAction func gameResetButton(_ sender: UIButton) {
        playAgain()
        resetScore()
    }
    
    func resetGame() {
        playAgain()
        resetScore()
    }
    
    func playAgain() {
        ticTacToeArr = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        whosTurnLabel.text = "X goes first"
        xsScore.text = "X Score: \(xScore)"
        osScore.text = "O Score: \(oScore)"
        for i in 1...9 {
            let button = view.viewWithTag(i) as! UIButton
            button.setImage(nil, for: UIControlState())
        }
    }
    
    func checkCombo() {
        for combo in winningCombinationArr {
            if ticTacToeArr[combo[0]] != 0 && ticTacToeArr[combo[0]] == ticTacToeArr[combo[1]]
                && ticTacToeArr[combo[1]] == ticTacToeArr[combo[2]] {
                gameActive = false
                
                //X has won
                if ticTacToeArr[combo[0]] == 1 {
                    xScore += 1
                    currentPlayer = 1
                    //Popup alert X has won, also acts to prohibit futher action
                    let alert =  UIAlertController(title: "Three In A Row!", message: "X has won!", preferredStyle: .alert)
                    let restartAction = UIAlertAction(title: "Play Again", style: .default, handler: {(UIAlertAction) in
                        self.playAgain()})
                    alert.addAction(restartAction)
                    present(alert, animated: true, completion: nil)
                }
                
                //O has won
                else {
                    oScore += 1
                    
                    //Popup alert O has won! also acts to prohibit futher action
                    let alert =  UIAlertController(title: "Three In A Row!", message: "O has won!", preferredStyle: .alert)
                    let restartAction = UIAlertAction(title: "Play Again", style: .default, handler: {(UIAlertAction) in
                        self.playAgain()})
                    alert.addAction(restartAction)
                    present(alert, animated: true, completion: nil)
                }
            }
        }
    
        gameActive = false
        gameActiveCheck()
        
        //Tie popup, activates when no one has won and ticTacToeArr has no more 0s
        if gameActive == false {
            let alert =  UIAlertController(title: "Draw!", message: "It's a tie!", preferredStyle: .alert)
            let restartAction = UIAlertAction(title: "Play Again", style: .default, handler: {(UIAlertAction) in self.playAgain()})
            alert.addAction(restartAction)
            present(alert, animated: true, completion: nil)
        }
    }
}






