//
//  game.swift
//  ApplePie
//
//  Created by Office-iMac on 2020-09-11.
//  Copyright © 2020 Tony Jem. All rights reserved.
//

import Foundation

struct Game{
    var currentWord:String
    var remainingIncorrectAnswers: Int
    var totalScore: Int
    
    var currentPlayer:Player {
        var setToPlayer = player1
        if player1.isCurrentPlayer == false {
            setToPlayer = player2
        }
        return setToPlayer
    }
        
    let pointsPerCorrectLetter:Int = 5
    var tappedLetters:[Character] = []
    
    var formattedWord:String {
        var formattedWord:String = ""
        for letter in currentWord{
            if tappedLetters.contains(letter){
                formattedWord += String(letter)
            } else {
                formattedWord += "_"
            }
        }
        return formattedWord
    }
    
    mutating func checkTapped(letter letterTapped:Character){
        tappedLetters.append(letterTapped)
        if currentWord.contains(letterTapped){
            for letter in currentWord{
                if letter == letterTapped{
                    currentPlayer.totalScore += pointsPerCorrectLetter
                }
            }
        } else {
            remainingIncorrectAnswers -= 1
            switchPlayers()
        }
    }
    
    func switchPlayers(){
        if player1.isCurrentPlayer == true{
            player1.isCurrentPlayer = false
            player2.isCurrentPlayer = true
        } else {
            player1.isCurrentPlayer = true
            player2.isCurrentPlayer = false
        }
    }
}
