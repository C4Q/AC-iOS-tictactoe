//
//  ViewController.swift
//  ticTacToe
//
//  Created by C4Q  on 9/27/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        X.isHidden = true
        O.isHidden = true
        arrayOfButtons += [BottomLeft,BottomRight,BottomCenter,Right,Left,Center, TopCenter, TopRight, TopLeft]
        for button in arrayOfButtons {
            button.isEnabled = false
        }
    }
    
    var buttons: [[GameButton]] = []
    var ticTacToeMind = ticTacToeBrain()
    
    @IBOutlet weak var BottomRight: GameButton!
    @IBOutlet weak var BottomCenter: GameButton!
    @IBOutlet weak var BottomLeft: GameButton!
    @IBOutlet weak var Right: GameButton!
    @IBOutlet weak var Center: GameButton!
    @IBOutlet weak var Left: GameButton!
    @IBOutlet weak var TopRight: GameButton!
    @IBOutlet weak var TopCenter: GameButton!
    @IBOutlet weak var TopLeft: GameButton!
    @IBOutlet weak var X: UIButton!
    @IBOutlet weak var O: UIButton!
    @IBOutlet weak var RulesLabel: UILabel!
    
    
    var arrayOfButtons = [GameButton]()
    
    @IBAction func NewGamePressed(_ sender: UIButton) {
        ticTacToeMind.counter = 9
        X.isHidden = false
        O.isHidden = false
        RulesLabel.text = "Player One, Pick X or O"
        playerOne = ""
        playerTwo = ""
        ticTacToeMind.playerOne = Set<Int>()
        ticTacToeMind.playerTwo = Set<Int>()
        for button in arrayOfButtons {
            button.isEnabled = false
            button.setImage(#imageLiteral(resourceName: "questionmark"), for: .normal)
        }
        ticTacToeMind.win = false
        
        
    }
    
    var playerOne = ""
    var playerTwo = ""
    
    func enableButtons() {
        for button in arrayOfButtons {
            button.isEnabled = true
            button.setImage(#imageLiteral(resourceName: "questionmark"), for: .normal)
        }
    }
    
    
    @IBAction func XChosen(_ sender: UIButton) {
        playerOne = "X"
        playerTwo = "O"
        RulesLabel.text = "Player One has chosen X. Player One Go."
        enableButtons()
        X.isHidden = true
        O.isHidden = true
        
    }
    @IBAction func OChosen(_ sender: UIButton) {
        playerOne = "O"
        playerTwo = "X"
        RulesLabel.text = "Player One has chosen O. Player One Go."
        enableButtons()
        X.isHidden = true
        O.isHidden = true
    }
    
    func turnTimer() {
        ticTacToeMind.counter -= 1
    }
    
    
    
    @IBAction func PlaceXOrO(_ sender: GameButton) {
        sender.isEnabled = false
        switch ticTacToeMind.counter {
        //Player One
        case _ where ticTacToeMind.counter % 2 == 1:
            RulesLabel.text = "Player Two go."
            if playerOne == "X" && ticTacToeMind.counter % 2 == 1  {
                sender.setImage(#imageLiteral(resourceName: "CuteFlowerX"), for: .normal)
                ticTacToeMind.playerOne.insert(sender.tag)
            }
            if playerOne == "O" && ticTacToeMind.counter % 2 == 1 {
                sender.setImage(#imageLiteral(resourceName: "CuteFlowerO"), for: .normal)
                ticTacToeMind.playerOne.insert(sender.tag)
                
            }
            
        case _ where ticTacToeMind.counter % 2 == 0:
            //Player Two
            RulesLabel.text = "Player One go."
            if playerTwo == "X" && ticTacToeMind.counter % 2 == 0  {
                sender.setImage(#imageLiteral(resourceName: "CuteFlowerX"), for: .normal)
                ticTacToeMind.playerTwo.insert(sender.tag)
            }
            if playerTwo == "O" && ticTacToeMind.counter % 2 == 0{
                sender.setImage(#imageLiteral(resourceName: "CuteFlowerO"), for: .normal)
                ticTacToeMind.playerTwo.insert(sender.tag)
            }
            
        default:
            break
        }
        
        
        
        ticTacToeMind.checkWin()
        if ticTacToeMind.win == true && ticTacToeMind.counter % 2 == 1 {
            RulesLabel.text = "Player One is the champion!"
        }
        if ticTacToeMind.win == true && ticTacToeMind.counter % 2 == 0 {
            RulesLabel.text = "Player Two is the winner!"
        }
        if ticTacToeMind.win == false && ticTacToeMind.counter == 1 {
            RulesLabel.text = "You both suck. Try again."
            
            
        }
        turnTimer()
    }
}






