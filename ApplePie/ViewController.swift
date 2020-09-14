//
//  ViewController.swift
//  ApplePie
//
//  Created by Office-iMac on 2020-09-11.
//  Copyright © 2020 Tony Jem. All rights reserved.
//

import UIKit

var player1 = Player(name: "FirstPlayer", totalScore: 0, isCurrentPlayer: true)
var player2 = Player(name: "SecondPlayer", totalScore: 0, isCurrentPlayer: false)

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
    @IBOutlet var player1ScoreLabel: UILabel!
    @IBOutlet var player2ScoreLabel: UILabel!
    
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
        
        player1ScoreLabel.text = "\(player1.name): \(player1.totalScore)"
        player1ScoreLabel.isEnabled = player1.isCurrentPlayer
        
        totalScore = currentGame.totalScore
        scoreLabel.text = "Wins: \(totalWins), Losses: \(totalLosses), TotalScore: \(player1.totalScore + player2.totalScore)"
        
        player2ScoreLabel.text = "\(player2.name): \(player2.totalScore)"
        player2ScoreLabel.isEnabled = player2.isCurrentPlayer
    }
    
    func checkGameStatus(){
        if currentGame.remainingIncorrectAnswers < 0 {
            totalLosses += 1
        }
        if currentGame.formattedWord == currentGame.currentWord{
            currentGame.currentPlayer.totalScore += pointsPerCorrectWord
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

