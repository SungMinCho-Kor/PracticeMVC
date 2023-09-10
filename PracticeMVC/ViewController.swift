//
//  ViewController.swift
//  PracticeMVC
//
//  Created by 조성민 on 2023/09/09.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var playersView: PlayersView!
    var player1: Player = Player(name: "p1")
    var player2: Player = Player(name: "p2")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playersView.setPlayersInformation(p1: player1, p2: player2)
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(receiveNotification(_:)),
            name: Notification.Name("NotificationPosted"),
            object: nil
        )
        playersView.delegate = self
        playersView.dataSource = self
        playersView.clearButton.addTarget(self, action: #selector(clearButtonTapped(_:)), for: .touchUpInside)
    }
    
    @objc func clearButtonTapped(_ sender: UIButton){
        player1.score = 0
        player2.score = 0
        player1.done = false
        player2.done = false
        
    }
    
    @objc func receiveNotification(_ sender: Notification){
        guard let content = sender.userInfo?["content"] as? String else {return}
        print(content)
    }
    
}

extension ViewController: PlayerViewDelegate{
    func player1GetOneScore() {
        player1.score += 1
    }
    func player2GetOneScore() {
        player2.score += 1
    }
}

extension ViewController: PlayerViewDataSource{
    func getPlayer1() -> Player {
        return player1
    }
    func getPlayer2() -> Player {
        return player2
    }
}
