//
//  MainView.swift
//  PracticeMVC
//
//  Created by 조성민 on 2023/09/09.
//

import UIKit

class PlayersView: UIView {
    @IBOutlet weak var clearButton: UIButton!
    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()

    }
    @IBOutlet weak var player1Name: UILabel!
    @IBOutlet weak var player1Score: UILabel!
    @IBOutlet weak var player1Done: UILabel!
    @IBOutlet weak var player2Name: UILabel!
    @IBOutlet weak var player2Score: UILabel!
    @IBOutlet weak var player2Done: UILabel!
    
    
    var delegate: PlayerViewDelegate!
    var dataSource: PlayerViewDataSource!
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        // xibSetup() // 하면 storyboard에서 실시간(컴파일타임)에 inspector창에서 변경해도 확인 불가
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup()
    }

    func xibSetup() {
        guard let view = loadViewFromNib(nib: String(describing: Self.self)) else {
            return
        }
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(view)
        self.clearButton.addTarget(self, action: #selector(self.clearButtonTapped(_:)), for: UIButton.Event.touchUpInside)        
    }

    func loadViewFromNib(nib: String) -> UIView? {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nib, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }
    
    func setPlayersInformation(p1: Player, p2: Player){
        player1Name.text = p1.name
        player1Score.text = String(p1.score)
        player1Done.text = String(p1.done)
        player2Name.text = p2.name
        player2Score.text = String(p2.score)
        player2Done.text = String(p2.done)
        
    }
    
    @IBAction func player1GetScoreButtonTapped(_ sender: UIButton) {
        delegate.player1GetOneScore()
        let player = dataSource.getPlayer1()
        print(player.name, player.score, player.done)
    }
    @IBAction func player2GetScoreButtonTapped(_ sender: UIButton) {
        delegate.player2GetOneScore()
        let player = dataSource.getPlayer2()
        print(player.name, player.score, player.done)
    }
    
    @objc func clearButtonTapped(_ sender: UIButton){
        //code
    }
    @IBAction func clearButtonTapped2(_ sender: UIButton) {
        //code
    }
    

}

protocol PlayerViewDelegate{
    func player1GetOneScore()
    func player2GetOneScore()
}

protocol PlayerViewDataSource{
    func getPlayer1() -> Player
    func getPlayer2() -> Player
}

