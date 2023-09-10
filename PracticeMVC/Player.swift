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
            }
        }
    }
    var done: Bool {
        didSet{
            postNotification()
        }
    }
    
    init(name: String = "Guest Player", score: Int = 0) {
        self.name = name
        self.score = score
        self.done = false
    }
    
    func postNotification(){
        NotificationCenter.default.post(
            name: NSNotification.Name("NotificationPosted"),
            object: nil,
            userInfo: ["content": "메롱"]
        )
    }
}
