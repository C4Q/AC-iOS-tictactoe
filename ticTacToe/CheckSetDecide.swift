//
//  CheckSetDecide.swift
//  ticTacToe
//
//  Created by C4Q on 10/20/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import Foundation
import UIKit
class CheckSetDecide {
    var player = 1
    var freeze = false
    var drawCounter = 0
    var playerwins = [[2: 1, 3: 1, 1: 1],
                      [5: 1, 4: 1, 6: 1],
                      [7: 1, 8: 1, 9: 1],
                      [5: 1, 9: 1, 1: 1],
                      [5: 1, 3: 1, 7: 1],
                      [4: 1, 1: 1, 7: 1],
                      [2: 1, 5: 1, 8: 1],
                      [6: 1, 3: 1, 9: 1],
                      [2: 2, 3: 2, 1: 2],
                      [5: 2, 4: 2, 6: 2],
                      [7: 2, 8: 2, 9: 2],
                      [5: 2, 9: 2, 1: 2],
                      [5: 2, 3: 2, 7: 2],
                      [4: 2, 1: 2, 7: 2],
                      [2: 2, 5: 2, 8: 2],
                      [6: 2, 3: 2, 9: 2]]
    var arrayOfButtons = [UIButton]()
    // key is the cell and value is the player
    var myDictionary:[Int:Int] = [0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0, 9:0]
    func getWinner(playerWins: [[Int:Int]], playerTurnLabel: UILabel, player:Int){
        var counterPlayer1 = 0
        var counterPlayer2 = 0
        for dict in playerWins{
            for (key,_) in dict{
                if myDictionary[key] == 1{
                    counterPlayer1 += 1
                }
                if myDictionary[key] == 2{
                    counterPlayer2 += 1
                }
            }
            if counterPlayer1 == 3{
                playerTurnLabel.text = "player One wins"
                playerTurnLabel.isEnabled = false
                freeze = true
                break
            }
            if counterPlayer2 == 3{
                playerTurnLabel.text = "player Two wins"
                playerTurnLabel.isEnabled = false
                freeze = true
                break
            }
            counterPlayer2 = 0
            counterPlayer1 = 0
        }

    }
    func checkPlayerSetImage(senderButton: UIButton, playerTurnLabel: UILabel){
        if myDictionary[senderButton.tag] == 0{
            if player == 1 && freeze == false{
                drawCounter += 1
                arrayOfButtons.append(senderButton)
                senderButton.setImage(#imageLiteral(resourceName: "X"), for: .normal)
                playerTurnLabel.text = "Player two Turn place O"
                myDictionary[senderButton.tag] = player
                getWinner(playerWins: playerwins, playerTurnLabel: playerTurnLabel, player: player)
                player = 2
            }
            else if player == 2 && freeze == false
            {
                drawCounter += 1
                arrayOfButtons.append(senderButton)
                senderButton.setImage(#imageLiteral(resourceName: "O"), for: .normal)
                playerTurnLabel.text = "Player One Turn place X"
                myDictionary[senderButton.tag] = player
                getWinner(playerWins: playerwins, playerTurnLabel: playerTurnLabel, player: player)
                player = 1
            }
        }
        if drawCounter > 8{
            playerTurnLabel.text = "it is a draw"
        }
    }
    
    
    func resestCells(inputDictionary: [Int:Int], playerTurnLabel:UILabel)->[Int:Int]{
        var mynewDict = inputDictionary
        for (key, _) in mynewDict{
            mynewDict.updateValue(0, forKey: key)
        }
        for button in arrayOfButtons{
            button.setImage(nil, for: .normal)
        }
        playerTurnLabel.text = "Player One!! Play"
        freeze = false
        playerTurnLabel.isEnabled = true
        drawCounter = 0
        return mynewDict
    }
    func isItDraw(dictionary:[Int:Int], playerTurnLabel:UILabel) {
        if !dictionary.values.contains(0){
            playerTurnLabel.text = " It is a draw"
            freeze = true
        }
    }
    
    
}
