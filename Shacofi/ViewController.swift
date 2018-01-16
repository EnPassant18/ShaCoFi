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
            [outletA1, outletA2, outletA3, outletA4, outletA5],
            [outletB1, outletB2, outletB3, outletB4, outletB5],
            [outletC1, outletC2, outletC3, outletC4, outletC5]])
    }
    
    //MARK: Actions
    
    @IBAction func Pause(_ sender: Any) {
    }
    
    @IBAction func actionA5(_ sender: Any) {
        game.toggle(row: 4, col: 0)
    }
    
    @IBAction func actionB5(_ sender: Any) {
        game.toggle(row: 4, col: 1)
    }
    
    @IBAction func actionC5(_ sender: Any) {
        game.toggle(row: 4, col: 2)
    }
    
    @IBAction func actionA4(_ sender: Any) {
        game.toggle(row: 3, col: 0)
    }
    
    @IBAction func actionB4(_ sender: Any) {
        game.toggle(row: 3, col: 1)
    }
    
    @IBAction func actionC4(_ sender: Any) {
        game.toggle(row: 3, col: 2)
    }
    
    @IBAction func actionA3(_ sender: Any) {
        game.toggle(row: 2, col: 0)
    }
    
    @IBAction func actionB3(_ sender: Any) {
        game.toggle(row: 2, col: 1)
    }
    
    @IBAction func actionC3(_ sender: Any) {
        game.toggle(row: 2, col: 2)
    }
    
    @IBAction func actionA2(_ sender: Any) {
        game.toggle(row: 1, col: 0)
    }
    
    @IBAction func actionB2(_ sender: Any) {
        game.toggle(row: 1, col: 1)
    }
    
    @IBAction func actionC2(_ sender: Any) {
        game.toggle(row: 1, col: 2)
    }
    
    @IBAction func actionA1(_ sender: Any) {
        game.toggle(row: 0, col: 0)
    }
    
    @IBAction func actionB1(_ sender: Any) {
        game.toggle(row: 0, col: 1)
    }
    
    @IBAction func actionC1(_ sender: Any) {
        game.toggle(row: 0, col: 2)
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

