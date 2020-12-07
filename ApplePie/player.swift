import Foundation
class Player {
    var name: String
    var totalScore: Int
    var isCurrentPlayer: Bool

    init(name: String, totalScore: Int, isCurrentPlayer: Bool) {
        self.name = name
        self.totalScore = totalScore
        self.isCurrentPlayer = isCurrentPlayer
    }
}
