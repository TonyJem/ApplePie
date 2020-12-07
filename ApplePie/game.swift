import Foundation

struct Game{
    var currentWord:String
    var remainingIncorrectAnswers: Int
    var totalScore: Int
    
    var currentPlayer:Player {
        var setAsCurrentPlayer = player1
        if player1.isCurrentPlayer == false {
            setAsCurrentPlayer = player2
        }
        return setAsCurrentPlayer
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
