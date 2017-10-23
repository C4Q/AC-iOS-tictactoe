//
//  ViewController.swift
//  ticTacToe
//
//  Created by C4Q  on 9/27/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let xoChechSet = CheckSetDecide()
    
    @IBOutlet weak var PlayerOneScoreLabel: UILabel!
    
    @IBOutlet weak var PlayerTwoScoreLabel: UILabel!
    
    @IBOutlet weak var playerTurnLabel: UILabel!
    @IBAction func cellButton(_ sender: UIButton) {
        xoChechSet.checkPlayerSetImage(senderButton: sender, playerTurnLabel: playerTurnLabel, scorePlayerOne: PlayerOneScoreLabel, scorePlayerTwo: PlayerTwoScoreLabel)
        xoChechSet.isItDraw(dictionary: xoChechSet.myDictionary, playerTurnLabel: playerTurnLabel)
    }
    @IBAction func resetButton(_ sender: UIButton) {
        print(xoChechSet.myDictionary)
        xoChechSet.myDictionary = xoChechSet.resestCells(inputDictionary: xoChechSet.myDictionary, playerTurnLabel: playerTurnLabel)
    }

    override func viewDidLoad() {
        
        super.viewDidLoad()
        //Execute code here
    }
}

