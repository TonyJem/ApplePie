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
        if !currentWord.contains(letterTapped){
            remainingIncorrectAnswers -= 1
        }
    }
}
