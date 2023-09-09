//
//  Player.swift
//  PracticeMVC
//
//  Created by 조성민 on 2023/09/09.
//

import Foundation

struct Player {
    let name: String
    var score: Int
    var done: Bool {
        if self.score > 10{
            return true
        }
        return false
    }
    
    init(name: String = "Guest Player", score: Int = 0) {
        self.name = name
        self.score = score
    }
    
    mutating func getScore(score: Int){
        self.score += score
    }
}
