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
        let testText = "test"
        return testText
    }
}
