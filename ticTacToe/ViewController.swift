//
//  ViewController.swift
//  ticTacToe
//
//  Created by C4Q  on 9/27/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var player = 1
    var xWins = 0
    var oWins = 0
    var one = 1
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button5: UIButton!
    @IBOutlet weak var button6: UIButton!
    @IBOutlet weak var button7: UIButton!
    @IBOutlet weak var button8: UIButton!
    @IBOutlet weak var button9: UIButton!
    @IBOutlet weak var winLabel: UILabel!
    @IBOutlet weak var xScore: UILabel!
    @IBOutlet weak var oScore: UILabel!
    @IBOutlet weak var gameBoard: UIView!
  
    
    
    @IBOutlet weak var playerTurn: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        winLabel.text = " "
        //Execute code here
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        if player == 1 {
            //X
            playerTurn.text = "X's turn!"
            sender.setImage(UIImage(named: "xIcon.png"), for: UIControlState())
            playerTurn.text = "O's turn!"
            sender.tag = 1
            sender.isEnabled = false
            player = 2
            print(sender.tag)
        }else if player == 2{
            //O
            sender.setImage(UIImage(named: "oIcon.png"), for: UIControlState())
            playerTurn.text = "X's turn!"
            sender.tag = 2
            sender.isEnabled = false
            player = 1
            print(sender.tag)
        }
        if button1.tag == one && button2.tag == one && button3.tag == one {
//            print("x wins")
            xWins += 1
            winLabel.text = "X wins"
            xScore.text = "X Score: \(xWins)"
            gameBoard.isHidden = true
            playerTurn.isHidden = true
            
        }
     else if button1.currentImage  == #imageLiteral(resourceName: "oIcon"), button2.currentImage  == #imageLiteral(resourceName: "oIcon"), button3.currentImage == #imageLiteral(resourceName: "oIcon"){
             oWins += 1
            oScore.text = "O Score: \(oWins)"
//            print("o wins")
            winLabel.text = "O wins"
            oScore.text = "O Score: \(oWins)"
            gameBoard.isHidden = true
          playerTurn.isHidden = true
        }
        if button4.tag == one && button5.tag == one && button6.tag == one {
            //            print("x wins")
            xWins += 1
            winLabel.text = "X wins"
            xScore.text = "X Score: \(xWins)"
            gameBoard.isHidden = true
            playerTurn.isHidden = true
            
        }
        else if button4.currentImage  == #imageLiteral(resourceName: "oIcon"), button5.currentImage  == #imageLiteral(resourceName: "oIcon"), button6.currentImage == #imageLiteral(resourceName: "oIcon"){
            oWins += 1
            oScore.text = "O Score: \(oWins)"
            //            print("o wins")
            winLabel.text = "O wins"
            oScore.text = "O Score: \(oWins)"
            gameBoard.isHidden = true
            playerTurn.isHidden = true
        }
        if button7.tag == one && button8.tag == one && button9.tag == one {
            //            print("x wins")
            xWins += 1
            winLabel.text = "X wins"
            xScore.text = "X Score: \(xWins)"
            gameBoard.isHidden = true
            playerTurn.isHidden = true
            
        }
        else if button7.currentImage  == #imageLiteral(resourceName: "oIcon"), button8.currentImage  == #imageLiteral(resourceName: "oIcon"), button9.currentImage == #imageLiteral(resourceName: "oIcon"){
            oWins += 1
            oScore.text = "O Score: \(oWins)"
            //            print("o wins")
            winLabel.text = "O wins"
            oScore.text = "O Score: \(oWins)"
            gameBoard.isHidden = true
            playerTurn.isHidden = true
        }
        if button1.tag == one && button5.tag == one && button9.tag == one {
            //            print("x wins")
            xWins += 1
            winLabel.text = "X wins"
            xScore.text = "X Score: \(xWins)"
            gameBoard.isHidden = true
            playerTurn.isHidden = true
            
        }
        else if button1.currentImage  == #imageLiteral(resourceName: "oIcon"), button5.currentImage  == #imageLiteral(resourceName: "oIcon"), button9.currentImage == #imageLiteral(resourceName: "oIcon"){
            oWins += 1
            oScore.text = "O Score: \(oWins)"
            //            print("o wins")
            winLabel.text = "O wins"
            oScore.text = "O Score: \(oWins)"
            gameBoard.isHidden = true
            playerTurn.isHidden = true
        }
        if button1.tag == one && button4.tag == one && button7.tag == one {
            //            print("x wins")
            xWins += 1
            winLabel.text = "X wins"
            xScore.text = "X Score: \(xWins)"
            gameBoard.isHidden = true
            playerTurn.isHidden = true
            
        }
        else if button1.currentImage  == #imageLiteral(resourceName: "oIcon"), button4.currentImage  == #imageLiteral(resourceName: "oIcon"), button7.currentImage == #imageLiteral(resourceName: "oIcon"){
            oWins += 1
            oScore.text = "O Score: \(oWins)"
            //            print("o wins")
            winLabel.text = "O wins"
            oScore.text = "O Score: \(oWins)"
            gameBoard.isHidden = true
            playerTurn.isHidden = true
        }
        if button2.tag == one && button5.tag == one && button8.tag == one {
            //            print("x wins")
            xWins += 1
            winLabel.text = "X wins"
            xScore.text = "X Score: \(xWins)"
            gameBoard.isHidden = true
            playerTurn.isHidden = true
            
        }
        else if button2.currentImage  == #imageLiteral(resourceName: "oIcon"), button5.currentImage  == #imageLiteral(resourceName: "oIcon"), button8.currentImage == #imageLiteral(resourceName: "oIcon"){
            oWins += 1
            oScore.text = "O Score: \(oWins)"
            //            print("o wins")
            winLabel.text = "O wins"
            oScore.text = "O Score: \(oWins)"
            gameBoard.isHidden = true
            playerTurn.isHidden = true
        }
        if button3.tag == one && button6.tag == one && button9.tag == one {
            //            print("x wins")
            xWins += 1
            winLabel.text = "X wins"
            xScore.text = "X Score: \(xWins)"
            gameBoard.isHidden = true
            playerTurn.isHidden = true
            
        }
        else if button3.currentImage  == #imageLiteral(resourceName: "oIcon"), button6.currentImage  == #imageLiteral(resourceName: "oIcon"), button9.currentImage == #imageLiteral(resourceName: "oIcon"){
            oWins += 1
            oScore.text = "O Score: \(oWins)"
            //            print("o wins")
            winLabel.text = "O wins"
            oScore.text = "O Score: \(oWins)"
            gameBoard.isHidden = true
            playerTurn.isHidden = true
        }
        if button3.tag == one && button5.tag == one && button7.tag == one {
            //            print("x wins")
            xWins += 1
            winLabel.text = "X wins"
            xScore.text = "X Score: \(xWins)"
            gameBoard.isHidden = true
            playerTurn.isHidden = true
            
        }
        else if button3.currentImage  == #imageLiteral(resourceName: "oIcon"), button5.currentImage  == #imageLiteral(resourceName: "oIcon"), button7.currentImage == #imageLiteral(resourceName: "oIcon"){
            oWins += 1
            oScore.text = "O Score: \(oWins)"
            //            print("o wins")
            winLabel.text = "O wins"
            oScore.text = "O Score: \(oWins)"
            gameBoard.isHidden = true
            playerTurn.isHidden = true
        }
        }
    
@IBAction func resetButton(_ sender: UIButton) {
    player = 1
//    xWins = 0
//    oWins = 0
    gameBoard.isHidden = false
    playerTurn.isHidden = false
    button1.setImage(nil, for: UIControlState())
    button2.setImage(nil, for: UIControlState())
    button3.setImage(nil, for: UIControlState())
    button4.setImage(nil, for: UIControlState())
    button5.setImage(nil, for: UIControlState())
    button6.setImage(nil, for: UIControlState())
    button7.setImage(nil, for: UIControlState())
    button8.setImage(nil, for: UIControlState())
    button9.setImage(nil, for: UIControlState())
    button1.tag = 0
    button2.tag = 0
    button3.tag = 0
    button4.tag = 0
    button5.tag = 0
    button6.tag = 0
    button7.tag = 0
    button8.tag = 0
    button9.tag = 0
    playerTurn.text = "X's turn!"
    button1.isEnabled = true
    button2.isEnabled = true
    button3.isEnabled = true
    button4.isEnabled = true
    button5.isEnabled = true
    button6.isEnabled = true
    button7.isEnabled = true
    button8.isEnabled = true
    button9.isEnabled = true
    }
    
}



