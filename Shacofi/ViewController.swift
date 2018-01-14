//
//  ViewController.swift
//  Shacofi
//
//  Created by Daniel Kostovetsky on 1/8/18.
//  Copyright © 2018 Daniel Kostovetsky. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func Pause(_ sender: Any) {
    }
    
    @IBOutlet weak var score: UILabel!
    @IBOutlet weak var best: UILabel!
    
    
    @IBAction func A5(_ sender: Any) {
        Game.select(row: 5, col: 1)
    }
    @IBOutlet weak var A5: UIButton!
    @IBAction func B5(_ sender: Any) {
    }
    @IBOutlet weak var B5: UIButton!
    @IBAction func C5(_ sender: Any) {
    }
    @IBOutlet weak var C5: UIButton!
    @IBAction func A4(_ sender: Any) {
    }
    @IBOutlet weak var A4: UIButton!
    @IBAction func B4(_ sender: Any) {
    }
    @IBOutlet weak var B4: UIButton!
    @IBAction func C4(_ sender: Any) {
    }
    @IBOutlet weak var C4: UIButton!
    @IBAction func A3(_ sender: Any) {
    }
    @IBOutlet weak var A3: UIButton!
    @IBAction func B3(_ sender: Any) {
    }
    @IBOutlet weak var B3: UIButton!
    @IBAction func C3(_ sender: Any) {
    }
    @IBOutlet weak var C3: UIButton!
    @IBAction func A2(_ sender: Any) {
    }
    @IBOutlet weak var A2: UIButton!
    @IBAction func B2(_ sender: Any) {
    }
    @IBOutlet weak var B2: UIButton!
    @IBAction func C2(_ sender: Any) {
    }
    @IBOutlet weak var C2: UIButton!
    @IBAction func A1(_ sender: Any) {
    }
    @IBOutlet weak var A1: UIButton!
    @IBAction func B1(_ sender: Any) {
    }
    @IBOutlet weak var B1: UIButton!
    @IBAction func C1(_ sender: Any) {
    }
    @IBOutlet weak var C1: UIButton!
    
}

