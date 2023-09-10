//
//  Player.swift
//  PracticeMVC
//
//  Created by 조성민 on 2023/09/09.
//

import Foundation

struct Player {
    let name: String
    var score: Int {
        didSet{
            if score > 10{
                done = true
            } else {
                done = false
            }
        }
    }
    var done: Bool
    
    init(name: String = "Guest Player", score: Int = 0) {
        self.name = name
        self.score = score
        self.done = false
    }
    
}
