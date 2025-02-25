//
//  StartController.swift
//  TicTacToe
//
//  Created by Jesús Ortega Ayala on 25/2/25.
//

import UIKit

class StartController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func startGame(_ sender: UIButton) {
        performSegue(withIdentifier: "StartToGame", sender: self)
    }
    
}
