//
//  ViewController.swift
//  CoreySays
//
//  Created by COREY ATKINSON on 12/5/23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var greenOutlet: UIButton!
    @IBOutlet weak var highscoreOutlet: UILabel!
    @IBOutlet weak var scoreOutlet: UILabel!
    @IBOutlet weak var redOutlet: UIButton!
    @IBOutlet weak var blueOutlet: UIButton!
    @IBOutlet weak var yellowOutlet: UIButton!
    
    var rando : [Int] = []
    var currentSpot = 0
    var gameOn = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var i = 0
        while i < 20 {
            rando.append(Int.random(in: 1...4))
            i = i + 1
        }
        var hi = 0
        while hi < rando.count
        {
            print(rando[hi])
            hi = hi + 1
        }
        
        // Do any additional setup after loading the view.
    }

    @IBAction func redAction(_ sender: UIButton) {
        if rando[currentSpot] != 1
        {
            gameOn = false
        }
        else
        {
            currentSpot = currentSpot + 1
        }
    }
    
    @IBAction func greenAction(_ sender: UIButton) {
        if rando[currentSpot] != 2
        {
            gameOn = false
        }
        else
        {
            currentSpot = currentSpot + 1
        }
    }
    
    @IBAction func yellowAction(_ sender: UIButton) {
        if rando[currentSpot] != 3
        {
            gameOn = false
        }
        else
        {
            currentSpot = currentSpot + 1
        }
    }
    
    @IBAction func blueAction(_ sender: UIButton) {
        if rando[currentSpot] != 4
        {
            gameOn = false
        }
        else
        {
            currentSpot = currentSpot + 1
        }
    }
}

