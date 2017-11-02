//
//  ViewController.swift
//  ticTacToe
//
//  Created by C4Q  on 9/27/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    
  
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet var testButton: [GameButton]!
    
    let myModel = ticTacToeBrain()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Execute code here
//         let x = self.view.superview!
        
}
    
    @IBAction func buttonWasPressed(_ sender: GameButton) {
        guard !myModel.GameIsActive else {
             messageLabel.text =  myModel.userButtonPressedInput(row: sender.row, column: sender.column)
            sender.setImage(myModel.activePlayer == .One ? #imageLiteral(resourceName: "x") : #imageLiteral(resourceName: "o"), for: .normal)
            return
        }
    }

    @IBAction func resetGame(_ sender: UIButton) {
        for button in testButton{
            button.setImage(nil, for: .normal)
        }
        messageLabel.text = nil
        myModel.boardReset()
        
    }
    
    
}

