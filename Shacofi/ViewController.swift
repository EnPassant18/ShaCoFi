//
//  ViewController.swift
//  Shacofi
//
//  Created by Daniel Kostovetsky on 1/8/18.
//  Copyright © 2018 Daniel Kostovetsky. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: Initializer
    
    var game: Game!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        game = Game(outlets: [
            [outletA1, outletB1, outletC1],
            [outletA2, outletB2, outletC2],
            [outletA3, outletB3, outletC3],
            [outletA4, outletB4, outletC4],
            [outletA5, outletB5, outletC5]])
    }
    
    //MARK: Actions
    
    @IBAction func Pause(_ sender: Any) {
    }
    
    @IBAction func actionA5(_ sender: Any) {
        game.toggle(row: 5, col: 1)
    }
    
    @IBAction func actionB5(_ sender: Any) {
        game.toggle(row: 5, col: 2)
    }
    
    @IBAction func actionC5(_ sender: Any) {
        game.toggle(row: 5, col: 3)
    }
    
    @IBAction func actionA4(_ sender: Any) {
        game.toggle(row: 4, col: 1)
    }
    
    @IBAction func actionB4(_ sender: Any) {
        game.toggle(row: 4, col: 2)
    }
    
    @IBAction func actionC4(_ sender: Any) {
        game.toggle(row: 4, col: 3)
    }
    
    @IBAction func actionA3(_ sender: Any) {
        game.toggle(row: 3, col: 1)
    }
    
    @IBAction func actionB3(_ sender: Any) {
        game.toggle(row: 3, col: 2)
    }
    
    @IBAction func actionC3(_ sender: Any) {
        game.toggle(row: 3, col: 3)
    }
    
    @IBAction func actionA2(_ sender: Any) {
        game.toggle(row: 2, col: 1)
    }
    
    @IBAction func actionB2(_ sender: Any) {
        game.toggle(row: 2, col: 2)
    }
    
    @IBAction func actionC2(_ sender: Any) {
        game.toggle(row: 2, col: 3)
    }
    
    @IBAction func actionA1(_ sender: Any) {
        game.toggle(row: 1, col: 1)
    }
    
    @IBAction func actionB1(_ sender: Any) {
        game.toggle(row: 1, col: 2)
    }
    
    @IBAction func actionC1(_ sender: Any) {
        game.toggle(row: 1, col: 3)
    }
    
    
    //MARK: Outlets
    
    @IBOutlet weak var score: UILabel!
    @IBOutlet weak var best: UILabel!
    
    @IBOutlet weak var outletA5: UIButton!
    @IBOutlet weak var outletB5: UIButton!
    @IBOutlet weak var outletC5: UIButton!
    @IBOutlet weak var outletA4: UIButton!
    @IBOutlet weak var outletB4: UIButton!
    @IBOutlet weak var outletC4: UIButton!
    @IBOutlet weak var outletA3: UIButton!
    @IBOutlet weak var outletB3: UIButton!
    @IBOutlet weak var outletC3: UIButton!
    @IBOutlet weak var outletA2: UIButton!
    @IBOutlet weak var outletB2: UIButton!
    @IBOutlet weak var outletC2: UIButton!
    @IBOutlet weak var outletA1: UIButton!
    @IBOutlet weak var outletB1: UIButton!
    @IBOutlet weak var outletC1: UIButton!
    
}

