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
        //Execute code here
        NewGameButton.isHidden = true
        model.setUpGame()
        self.setupNewGame()
    }
    
    var model = ticTacToeBrain()
    //var winBool = false
    
    @IBOutlet weak var NewGameButton: UIButton!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var labelOfWins: UILabel!
    @IBOutlet weak var button00: GameButton!
    @IBOutlet weak var button01: GameButton!
    @IBOutlet weak var button10: GameButton!
    @IBOutlet weak var button11: GameButton!
    @IBOutlet weak var button02: GameButton!
    @IBOutlet weak var button22: GameButton!
    @IBOutlet weak var button21: GameButton!
    @IBOutlet weak var button20: GameButton!
    @IBOutlet weak var button12: GameButton!
    
    var set1: Set<GameButton> {
        return [button00, button01, button02]
    }
    var set2: Set<GameButton> {
        return [button10, button11, button12]
    }
    var set3: Set<GameButton> {
        return [button20, button21, button22]
    }
    var set4: Set<GameButton> {
        return [button00, button10, button20]
    }
    var set5: Set<GameButton> {
        return [button01, button11, button21]
    }
    var set6: Set<GameButton> {
        return [button02, button12, button22]
    }
    var set7: Set<GameButton> {
        return [button00, button11, button22]
    }
    var set8: Set<GameButton> {
        return [button02, button11, button20]
    }
    var arrOfWinning: [Set<GameButton>] {
       return [set1, set2, set3, set4, set5, set6, set7, set8]
    }
   
    var arrOfAllButtons: [GameButton] {
        return [button00, button01, button02, button10, button11, button12, button20, button21, button22]
    }
    @IBAction func GameButtonPressed(_ sender: GameButton) {
        
       sender.setTitle(model.setTitleText(), for: .normal)
      changeLabelText()
   model.setOfPlayer(button: sender)
      
        func ifSomeWin() -> Bool {
            for set in arrOfWinning {
                if set.isSubset(of: model.setOfOne) {
                    model.winBool = true
                    model.addCountOne()
                    self.label.text = "Player One Wins!"
                    self.label.backgroundColor = .red
                    self.labelOfWins.text = "Player One Wins: \(model.countOne)         Player Two Wins: \(model.countTwo)"
                    
                } else if set.isSubset(of: model.setOfTwo) {
                    model.winBool = true
                    model.addCountTwo()
                    self.label.text = "Player Two Wins!"
                    self.label.backgroundColor = .yellow
                    self.labelOfWins.text = "Player One Wins: \(model.countOne)         Player Two Wins: \(model.countTwo)"
                }
                    
            }
            return model.winBool
            }
        
        if ifSomeWin() {
            NewGameButton.isHidden = false
            for bn in arrOfAllButtons {
                bn.isEnabled = false
            }
        }
        
       sender.isEnabled = false
        
        if model.setOfOne.count == 5 && ifSomeWin() == false {
            NewGameButton.isHidden = false
            self.label.text = "No One Wins!"
        }
      
    }
    
    @IBAction func newGameButtonPressed(_ sender: UIButton) {
        self.viewDidLoad()
        for bn in arrOfAllButtons {
            bn.isEnabled = true
            bn.setTitle("", for: .normal)
        }
        
    }
    
    func setupNewGame() {
        self.label.text = "Player One's turn! Place an X"
        self.label.backgroundColor = .white
    }
    
    func changeLabelText() {
        if self.label.text == "Player One's turn! Place an X" {
            self.label.text = "player Two's turn! Place an O"
        } else {
            self.label.text = "Player One's turn! Place an X"
        }
    }
    
}
