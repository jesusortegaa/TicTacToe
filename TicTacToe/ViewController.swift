//
//  ViewController.swift
//  TicTacToe
//
//  Created by Jesús Ortega Ayala on 25/2/25.
//

import UIKit

class ViewController: UIViewController {
    
    enum Turn:String{
        case Circle = "🅾️"
        case Cross = "❎"
        
        mutating func toggle(){
            self = (self == .Circle) ? .Cross : .Circle
        }
        
    }
    
    var turn = Turn.Circle
    
    @IBOutlet weak var turnLabel: UILabel!
    
    @IBOutlet weak var a1: UIButton!
    @IBOutlet weak var a2: UIButton!
    @IBOutlet weak var a3: UIButton!
    
    @IBOutlet weak var b3: UIButton!
    @IBOutlet weak var b2: UIButton!
    @IBOutlet weak var b1: UIButton!
    
    @IBOutlet weak var c1: UIButton!
    @IBOutlet weak var c2: UIButton!
    @IBOutlet weak var c3: UIButton!
    
    var board:[UIButton] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        board = [a1,a2,a3,b1,b2,b3,c1,c2,c3]
        
    }
    
    @IBAction func cellPressed(_ sender: UIButton) {
        let player = turn.rawValue
        
        if(sender.currentTitle != nil){
            return
        }
        
        sender.setTitle(player, for: .normal)
        
        if(checkVictory(withLastPlayer: player)){
            turnLabel.text = "\(player) won"
            return
        }
        if(checkFullBoard()){
            turnLabel.text = "Draw!"
            return
        }
        
        turn.toggle()
        turnLabel.text = "It's \(turn.rawValue) turn"
        
    }
    
    func checkFullBoard() -> Bool{
        return board.allSatisfy({$0.currentTitle != nil})
    }
    
    func checkVictory(withLastPlayer player:String) -> Bool{
        let winningCombinations: [[Int]] = [
            [0, 1, 2], [3, 4, 5], [6, 7, 8], // Horizontal
            [0, 3, 6], [1, 4, 7], [2, 5, 8], // Vertical
            [0, 4, 8], [2, 4, 6]             // Diagonal
        ]
        for combination in winningCombinations {
            if(combination.allSatisfy({board[$0].currentTitle == player})){
                print(combination)
                return true
            }
        }
        return false
    }
    
    
    
}

