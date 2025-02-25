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
    
    @IBOutlet weak var reset: UIButton!
    
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
            turnLabel.text = "Draw"
            
            return
        }
        
        turn.toggle()
        turnLabel.text = "It's \(turn.rawValue) turn"
    }
    
    func checkFullBoard() -> Bool{
        if(board.allSatisfy({$0.currentTitle != nil})){
            for cell in board{
                cell.backgroundColor = .gray
            }
            reset.isHidden = false
            return true
        }
        return false
    }
    
    func highLightWinner(withCombination combination: [Int]){
        for index in combination{
            board[index].backgroundColor = .systemYellow
        }
    }
    
    func checkVictory(withLastPlayer player:String) -> Bool{
        let winningCombinations: [[Int]] = [
            [0, 1, 2], [3, 4, 5], [6, 7, 8], // Horizontal
            [0, 3, 6], [1, 4, 7], [2, 5, 8], // Vertical
            [0, 4, 8], [2, 4, 6]             // Diagonal
        ]
        for combination in winningCombinations {
            if(combination.allSatisfy({board[$0].currentTitle == player})){
                highLightWinner(withCombination: combination)
                reset.isHidden = false
                return true
            }
        }
        return false
    }
    
    @IBAction func reset(_ sender: UIButton) {
        for button in board {
            button.setTitle(nil, for: .normal)
            button.isEnabled = true
            button.backgroundColor = .systemBackground // Restaurar color de fondo
        }
        reset.isHidden = true
        turn = .Circle
        turnLabel.text = "It's \(turn.rawValue) turn"
    }
    
    
    
}

