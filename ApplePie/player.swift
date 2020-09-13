//
//  player.swift
//  ApplePie
//
//  Created by Office-iMac on 2020-09-13.
//  Copyright © 2020 Tony Jem. All rights reserved.
//

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
