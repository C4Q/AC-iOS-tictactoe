//
//  ViewController.swift
//  ticTacToe
//
//  Created by C4Q  on 9/27/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var oWinsLabel: UILabel!
    @IBOutlet weak var oNeverHidden: UILabel!
    @IBOutlet weak var xNeverHidden: UILabel!
    @IBOutlet weak var counterNeverHidden: UILabel!
    @IBOutlet weak var xWinsLabel: UILabel!
    //Button Stuff
 var buttonArr = [GameButton]()
    
    
    @IBAction func PlayAgainAction(_ sender: UIButton) {
        
        for button in buttonArr {
            button.isEnabled = true
            button.isHidden = false
            button.setImage(#imageLiteral(resourceName: "frame tic tac toe .png"), for: .normal)
            PlayAgain.isHidden = true
            PlayerIndicator.isHidden = true
            WinnerLabel.isHidden = true
        
        }
        
        turn = 0
        horizontal1 = [String]()
        horizontal2 = [String]()
        horizontal3 = [String]()
        verticle1 = [String]()
        verticle2 = [String]()
        verticle3 = [String]()
        diagonal1 = [String]()
        diagonal2 = [String]()
    }
    @IBOutlet weak var PlayAgain: UIButton!
    @IBOutlet weak var WinnerLabel: UILabel!
    @IBOutlet weak var button0: GameButton!
    @IBOutlet weak var button1: GameButton!
    @IBOutlet weak var button2: GameButton!
    @IBOutlet weak var button4: GameButton!
    @IBOutlet weak var button3: GameButton!
    @IBOutlet weak var button5: GameButton!
    @IBOutlet weak var button7: GameButton!
    @IBOutlet weak var button6: GameButton!
    @IBOutlet weak var button8: GameButton!
    
    //Player Indicator
    @IBOutlet weak var PlayerIndicator: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonArr = [button0, button1,button2, button3, button4, button5, button6, button7, button8]
    }
    
    // Start view
    @IBOutlet weak var StartView: UIView!
    @IBOutlet weak var StartViewLabel: UILabel!

    @IBAction func StartButton(_ sender: UIButton) {
                StartView.isHidden = true
   
    }
    
    // Game Board Buttons
    
    @IBAction func boardButtons(_ sender: GameButton) {
  
        
        if player == 1 && turn < 8 {
            PlayerIndicator.text = "Player Two's Turn "
            sender.setImage(#imageLiteral(resourceName: "x tic tach toe framed"), for: .normal)
            sender.isEnabled = false
            player = 2
            
            turn += 1
            
            // Appends x to array

            switch (sender.row, sender.column) {
            case (0,0):
                horizontal1.append("x")
                verticle1.append("x")
                diagonal1.append("x")
            case (0,1):
                horizontal1.append("x")
                verticle2.append("x")
            case (0,2):
                horizontal1.append("x")
                verticle3.append("x")
                diagonal2.append("x")
            case (1,0):
                horizontal2.append("x")
                verticle1.append("x")
            case (1,1):
                horizontal2.append("x")
                verticle2.append("x")
                diagonal1.append("x")
                diagonal2.append("x")
            case (1,2):
                horizontal2.append("x")
                verticle3.append("x")
            case (2,0):
                horizontal3.append("x")
                diagonal2.append("x")
                verticle1.append("x")
            case (2,1):
                horizontal3.append("x")
                verticle2.append("x")
            case (2,2):
                horizontal3.append("x")
                verticle3.append("x")
                diagonal1.append("x")
            default:
                break
            }
            
            
            if horizontal1 == ["x","x","x"] || horizontal2 == ["x","x","x"] || horizontal3 == ["x","x","x"] || verticle1 == ["x","x","x"] || verticle2 == ["x","x","x"] || verticle3 == ["x","x","x"] || diagonal1 == ["x","x","x"] || diagonal2 == ["x","x","x"] {
                
                xWin = true
                xWinCounter += 1
                
                self.WinnerLabel.isHidden = false
                self.WinnerLabel.text = " Player X Wins!!"
                PlayAgain.isHidden = false
                self.PlayerIndicator.text = "Click to play again"
                
                
                
                
                for button in buttonArr{
                    button.isEnabled = false
                    button.isHidden = true
                    
                    
                }
                
            }
            
        } else if player == 2 && turn < 8 {
            PlayerIndicator.text = " Player One's Turn"
            sender.setImage( #imageLiteral(resourceName: "o tic tac toe framed .jpg"), for: .normal)
            sender.isEnabled = false
            player = 1
            
            
            turn += 1
            
            
            // Appens y to array
            switch (sender.row, sender.column) {
            case (0,0):
                horizontal1.append("o")
                verticle1.append("o")
                diagonal1.append("o")
            case (0,1):
                horizontal1.append("o")
                verticle2.append("o")
            case (0,2):
                horizontal1.append("o")
                verticle3.append("o")
                diagonal2.append("o")
            case (1,0):
                horizontal2.append("o")
                verticle1.append("o")
            case (1,1):
                horizontal2.append("o")
                verticle2.append("o")
                diagonal1.append("o")
                diagonal2.append("o")
            case (1,2):
                horizontal2.append("o")
                verticle3.append("o")
            case (2,0):
                horizontal3.append("o")
                diagonal2.append("o")
                verticle1.append("o")
            case (2,1):
                horizontal3.append("o")
                verticle2.append("o")
            case (2,2):
                horizontal3.append("o")
                verticle3.append("o")
                diagonal1.append("o")
            default:
                break
            }
            if horizontal1 == ["o","o","o"] || horizontal2 == ["o","o","o"] || horizontal3 == ["o","o","o"] || verticle1 == ["o","o","o"] || verticle2 == ["o","o","o"] || verticle3 == ["o","o","o"] || diagonal1 == ["o","o","o"] || diagonal2 == ["o","o","o"] {
                
                oWin = true
                oWinCounter += 1
                self.WinnerLabel.isHidden = false
                self.WinnerLabel.text = " Player O Wins!!"
                self.PlayerIndicator.text = "Click to play again"
                PlayAgain.isHidden = false
                
                
                for button in buttonArr{
                    button.isEnabled = false
                    button.isHidden = true
                    
                    
                }
            }
            
            
        }else if xWin == false && oWin == false {
            for button in buttonArr {
                button.isHidden = true
            }
            self.WinnerLabel.isHidden = false
            self.WinnerLabel.text = "It's a draw!"
            self.PlayerIndicator.text = "Click to play again"
            PlayAgain.isHidden = false
        }
        
        
        
        
        
        
        
        
        
        
        
        xWinsLabel.text = String(xWinCounter)
        oWinsLabel.text = String(oWinCounter)
        
    }

}




