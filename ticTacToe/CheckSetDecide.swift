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
    var playerTurn = 1
    var freeze = false
    var drawCounter = 0
    var playerOneWins = 0
    var playerTwoWins = 0
    var arrayOfButtons = [UIButton]()
    var myDictionary:[Int:Int] = [0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0, 9:0]
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
    class Player{
        var playerName: String
        var playerScore: Int
        var playerMessage: String
        var isWinner: Bool
        init(playerScore: Int, playerMessage:String, playerName: String, isWinner: Bool) {
            self.playerScore = playerScore
            
            self.playerMessage = playerMessage
            self.playerName = playerName
            self.isWinner = isWinner
        }
        convenience init() {
            self.init(playerScore: 0, playerMessage: " ", playerName: "Player One", isWinner: false)
        }
        func resetScore(){
            self.playerScore = 0
            self.playerMessage = ""
            self.playerName = "Player One"
            self.isWinner = false
        }
    }
    func winningDecision(playerWins: [[Int:Int]], player: Player){
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
                player.playerMessage = "player One wins"
                player.isWinner = true
                playerOneWins += 1
                //                freeze = true
                break
            }
            if counterPlayer2 == 3{
                player.playerMessage = "player Two wins"
                player.isWinner = true
                playerTwoWins += 1
                //                freeze = true
                break
            }
            counterPlayer2 = 0
            counterPlayer1 = 0
        }
    }
    func getPlayer(senderButton: UIButton) -> Player{
        let player = Player()
        print(senderButton.tag)
        if myDictionary[senderButton.tag] == 0{
            if playerTurn == 1 && freeze == false{
                drawCounter += 1
                arrayOfButtons.append(senderButton)
                player.playerName = "Player One"
                player.playerMessage = "Player two Turn place O"
                myDictionary[senderButton.tag] = playerTurn
                winningDecision(playerWins: playerwins, player: player)
                playerTurn = 2
            }
            else if playerTurn == 2 && freeze == false
            {
                drawCounter += 1
                arrayOfButtons.append(senderButton)
                player.playerName = "Player Two"
                player.playerMessage = "Player One Turn place X"
                myDictionary[senderButton.tag] = playerTurn
                winningDecision(playerWins: playerwins, player: player)
                playerTurn = 1
            }
        }
        if drawCounter > 8 && player.isWinner == false{
            player.playerMessage = "it is a draw"
            player.isWinner = false
        }
        return player
    }
    func resetCells(inputDictionary: [Int:Int])->[Int:Int]{
        var mynewDict = inputDictionary
        for (key, _) in mynewDict{
            mynewDict.updateValue(0, forKey: key)
        }
        drawCounter = 0
        freeze = false
        return mynewDict
    }
}

