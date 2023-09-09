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
        
    }
    

}
