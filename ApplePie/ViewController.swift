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
    var currentGame: Game!
    var listOfWords:[String] = ["apple", "book", "home"]
    var allowedIncorrectAnswers: Int = 7
    var totalScore: Int = 0
    let pointsPerCorrectWord:Int = 15
    
    var totalWins = 0{
        didSet{
            newRound()
        }
    }
    var totalLosses = 0{
        didSet{
            newRound()
        }
    }
    

    
    
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
        if !listOfWords.isEmpty{
            allButtonsEnabled(true)
            let wordForRound = listOfWords.removeFirst().lowercased()
            currentGame = Game(currentWord: wordForRound, remainingIncorrectAnswers: allowedIncorrectAnswers, totalScore: totalScore)
            updateUI()
        } else {
            allButtonsEnabled(false)
        }
    }
    
    func updateUI(){
        treeImageView.image = UIImage(named: "Tree \(currentGame.remainingIncorrectAnswers)")
        
        wordDisplayLabel.text = Array(currentGame.formattedWord).map {String($0)}.joined(separator: " ")
        
        totalScore = currentGame.totalScore
        scoreLabel.text = "Wins: \(totalWins), Losses: \(totalLosses), Score: \(totalScore)"
    }
    
    func checkGameStatus(){
        if currentGame.remainingIncorrectAnswers < 0 {
            totalLosses += 1
        }
        if currentGame.formattedWord == currentGame.currentWord{
            totalScore += pointsPerCorrectWord
            totalWins += 1
        }
    }
    
    func allButtonsEnabled(_ state:Bool){
        for button in letterButtons{
            button.isEnabled = state
        }
    }
    
    //    MARK: Actions:
    @IBAction func letterButtonsTapped(_ sender: UIButton) {
        sender.isEnabled = false
        let letterTapped = sender.title(for: .normal)!
        currentGame.checkTapped(letter: Character(letterTapped.lowercased()))
        checkGameStatus()
        updateUI()
    }
}

