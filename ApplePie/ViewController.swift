//
//  ViewController.swift
//  ApplePie
//
//  Created by Office-iMac on 2020-09-11.
//  Copyright © 2020 Tony Jem. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //    MARK: Properties:
    var currentGame:Game = Game(currentWord: "", remainingIncorrectAnswers: 0)
    var allowedIncorrectAnswers: Int = 7
    
    var totalWins = 0
    var totalLosses = 0
    
    var listOfWords:[String] = ["apple", "book", "home"]
    
    
    //    MARK: Outlets:
    @IBOutlet var treeImageView: UIImageView!
    @IBOutlet var letterButtons: [UIButton]!
    @IBOutlet var wordDisplayLabel: UILabel!
    @IBOutlet var scoreLabel: UILabel!
    
    //    MARK: Start here:
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        newRound()
    }
    
//    MARK: Functions:
    func newRound(){
        currentGame.currentWord = listOfWords.removeFirst().lowercased()
        currentGame.remainingIncorrectAnswers = allowedIncorrectAnswers
        updateUI()
    }
    
    func updateUI(){
        treeImageView.image = UIImage(named: "Tree \(currentGame.remainingIncorrectAnswers)")

        let formattedWord:String = currentGame.formattedWord
        var formattedWordAsArray:[String] = []
        for letter in formattedWord{
            formattedWordAsArray.append(String(letter))
        }
        let formattedWordToDisplay = formattedWordAsArray.joined(separator: " ")
        wordDisplayLabel.text = formattedWordToDisplay
        
        scoreLabel.text = "Wins: \(totalWins), Losses: \(totalLosses)"
    }
    
    //    MARK: Actions:
    @IBAction func letterButtonsTapped(_ sender: UIButton) {
        sender.isEnabled = false
        let letterTapped = sender.title(for: .normal)!
        currentGame.checkTapped(letter: Character(letterTapped.lowercased()))
        updateUI()
    }
}

