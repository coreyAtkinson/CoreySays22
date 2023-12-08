//
//  ViewController.swift
//  CoreySays
//
//  Created by COREY ATKINSON on 12/5/23.
//


import UIKit
public class Player: Codable{
    var name : String
    var score : Int
    init(name: String, score: Int) {
        self.name = name
        self.score = score
    }
}
public class AppData{
    static var people = [Player]()
    
}
class ViewController: UIViewController, UITextFieldDelegate {
    //Programing
    //1. Variables
    //2. Operators
    //3. If/else
    //4. Arrays
    //5. Functions
    //6. Classes
    //7. Nil Coalescing
    //8. Persistence
    //9. Timer
    //10. Inheritance
    
    //UI
    //1. TextFeild
    //2. Button
    //3. Label
    //4. Tableview
    //5. Navigation Controller
    //6. Alert Controller
    //7. Constraints
    //8. App Icon
    
    
    //yay
    
    
    @IBOutlet weak var leaderOutlet: UIButton!
    @IBOutlet weak var greenOutlet: UIButton!
    @IBOutlet weak var highscoreOutlet: UILabel!
    @IBOutlet weak var scoreOutlet: UILabel!
    @IBOutlet weak var redOutlet: UIButton!
    @IBOutlet weak var blueOutlet: UIButton!
    @IBOutlet weak var yellowOutlet: UIButton!
    @IBOutlet weak var diedOutlet: UILabel!
    @IBOutlet weak var startOutlet: UIButton!
    @IBOutlet weak var submitOutlet: UIButton!
    @IBOutlet weak var textOutlet: UITextField!
    let defaults = UserDefaults.standard
    
    var rando : [Int] = []
    var currentSpot = 0
    var full = 1
    var gameOn = false
    var blinking = false
    var score = 0
    var highscore = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        textOutlet.delegate = self
        
        
        highscore = defaults.integer(forKey: "theScore")

        if let items = defaults.data(forKey: "thePlayers") {
                        let decoder = JSONDecoder()
                        if let decoded = try? decoder.decode([Player].self, from: items) {
                            AppData.people = decoded
                        }
                }
        
        
        highscoreOutlet.text = "Highscore: \(highscore)"
        redOutlet.isEnabled = false
        greenOutlet.isEnabled = false
        yellowOutlet.isEnabled = false
        blueOutlet.isEnabled = false
        
        
        textOutlet.isHidden = true
        submitOutlet.isHidden = true
       // let seconds = 3.0
     //   DispatchQueue.main.asyncAfter(deadline: .now() + seconds) { [self] in
       
      //  }
        // Do any additional setup after loading the view.
    }

    @IBAction func submitAction(_ sender: UIButton) {
    
            AppData.people.append(Player(name: textOutlet.text ?? "", score: score))
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(AppData.people) {
                           defaults.set(encoded, forKey: "thePlayers")
                        }
        textOutlet.isHidden = true
        submitOutlet.isHidden = true
        startOutlet.isEnabled = true
        leaderOutlet.isEnabled = true
        textOutlet.isEnabled = false
        submitOutlet.isEnabled = false
        
    }
    @IBAction func redAction(_ sender: UIButton) {
     // blink(amount: 5, color: "")
        UIView.animate(withDuration: 0.5, animations: {
            sender.backgroundColor = UIColor.black
               },completion: { _ in
                   sender.backgroundColor = UIColor.systemRed //change it back to original color
               })
        
        if rando[currentSpot] != 1
        {
            gameOn = false
            print("died")
           // diedOutlet.text = "you died L + ratio + bozo"
          //  startOutlet.isEnabled = true
            die()
        }
        else
        {
            currentSpot = currentSpot + 1
            print("right")
            score = score + 1
            scoreOutlet.text = "Score: \(score)"
       //     blink(amount: currentSpot + 1, color: "")
        }
        if currentSpot == full
        {
            full = full + 1
            blink(amount: full, color: "")
        }
    }
    
    @IBAction func greenAction(_ sender: UIButton) {
        
        UIView.animate(withDuration: 0.5, animations: {
            sender.backgroundColor = UIColor.black
               },completion: { _ in
                   sender.backgroundColor = UIColor.systemGreen //change it back to original color
               })
        
        if rando[currentSpot] != 2
        {
            gameOn = false
            print("died")
        //    diedOutlet.text = "you died L + ratio + bozo"
          //  startOutlet.isEnabled = true
            die()
        }
        else
        {
            currentSpot = currentSpot + 1
            print("right")
            score = score + 1
            scoreOutlet.text = "Score: \(score)"
        }
        if currentSpot == full
        {
            full = full + 1
            blink(amount: full, color: "")
        }
    }
    
    @IBAction func yellowAction(_ sender: UIButton) {
        UIView.animate(withDuration: 0.5, animations: {
            sender.backgroundColor = UIColor.black
               },completion: { _ in
                   sender.backgroundColor = UIColor.systemYellow //change it back to original color
               })
        
        
        if rando[currentSpot] != 3
        {
            gameOn = false
            print("died")
           // diedOutlet.text = "you died L + ratio + bozo"
           // startOutlet.isEnabled = true
            die()
        }
        else
        {
            currentSpot = currentSpot + 1
            print("right")
            score = score + 1
            scoreOutlet.text = "Score: \(score)"
        }
        if currentSpot == full
        {
            full = full + 1
            blink(amount: full, color: "")
        }
    }
    
    @IBAction func blueAction(_ sender: UIButton) {
        UIView.animate(withDuration: 0.5, animations: {
            sender.backgroundColor = UIColor.black
               },completion: { _ in
                   sender.backgroundColor = UIColor.systemBlue //change it back to original color
               })
        
        
        if rando[currentSpot] != 4
        {
            gameOn = false
            print("died")
         //   diedOutlet.text = "you died L + ratio + bozo"
           // startOutlet.isEnabled = true
            die()
        }
        else
        {
            currentSpot = currentSpot + 1
            print("right")
            score = score + 1
            scoreOutlet.text = "Score: \(score)"
        }
        if currentSpot == full
        {
            full = full + 1
            blink(amount: full, color: "")
            
        }
    }
    
    @IBAction func startAction(_ sender: UIButton) {
     //   diedOutlet.text = ""
        score = 0
        full = 1
        scoreOutlet.text = "Score:"
        var twemp : [Int] = []
        var i = 0
        while i < 100 {
               twemp.append(Int.random(in: 1...4))
          //  rando.append(2)
            i = i + 1
        }
        rando = twemp
        var hi = 0
        while hi < rando.count
        {
            print(rando[hi])
            hi = hi + 1
        }
        gameOn = true
        blink(amount: full, color: "")
        redOutlet.isEnabled = true
        greenOutlet.isEnabled = true
        yellowOutlet.isEnabled = true
        blueOutlet.isEnabled = true
        startOutlet.isEnabled = false
        leaderOutlet.isEnabled = false
        
    }
    
    
    func blink(amount: Int, color: String) {
      currentSpot = 0
        
        redOutlet.isEnabled = false
        greenOutlet.isEnabled = false
        yellowOutlet.isEnabled = false
        blueOutlet.isEnabled = false
        var temp = 0
        if gameOn != false
        {
            // while(temp < amount)
            //    {
            //delay(2.0, closure: {})
            if currentSpot == rando.count{
                add20()
            }
            print("temp: \(temp)")
            print("curent num \(rando[temp])")
            Timer.scheduledTimer(withTimeInterval: 1.5, repeats: true) { [self] timer in
                
                if (temp == amount - 1) {
                    timer.invalidate()
                }
                
                
                // delay(2.0, closure: {})
                if rando[temp] == 1
                {
                    self.redOutlet.backgroundColor = UIColor.black
                    Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false) { [self] timer in
                        
                        redOutlet.backgroundColor = UIColor.red
                        
                    }
                    
                    
                    
                }
                if self.rando[temp] == 2
                {
                    self.greenOutlet.backgroundColor = UIColor.black
                    Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false) { [self] timer in
                        
                        greenOutlet.backgroundColor = UIColor.green
                        
                    }
                    
                    
                    
                    
                }
                if self.rando[temp] == 3
                {
                    self.yellowOutlet.backgroundColor = UIColor.black
                    
                    Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false) { [self] timer in
                        
                        yellowOutlet.backgroundColor = UIColor.yellow
                        
                    }
                    //  self.yellowOutlet.tintColor = UIColor.black
                    
                    //     let seconds = 1.0
                    //    DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
                    //        self.yellowOutlet.backgroundColor = UIColor.yellow
                    //        self.yellowOutlet.tintColor = UIColor.yellow
                    //    }
                }
                if self.rando[temp] == 4
                {
                    self.blueOutlet.backgroundColor = UIColor.black
                    
                    
                    Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false) { [self] timer in
                        
                        blueOutlet.backgroundColor = UIColor.blue
                        
                    }
                    //blueOutlet.tintColor = UIColor.black
                    //   let seconds = 1.0
                    //   DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
                    //      self.blueOutlet.backgroundColor = UIColor.blue
                    //   self.blueOutlet.tintColor = UIColor.blue
                    //   }
                }
                
                //  temp = temp + 1
                //   }
                temp = temp + 1
            }
            //       }
            
        }
        redOutlet.isEnabled = true
        greenOutlet.isEnabled = true
        yellowOutlet.isEnabled = true
        blueOutlet.isEnabled = true
    }
    
    
    func add20(){
        var i = 0
        while i < 20 {
               rando.append(Int.random(in: 1...4))
          //  rando.append(2)
            i = i + 1
        }
    }
    
    func die() {
     currentSpot = 0
        full = 1
        textOutlet.isHidden = false
        submitOutlet.isHidden = false
        textOutlet.isEnabled = true
        submitOutlet.isEnabled = true
        if score > defaults.integer(forKey: "theScore")
        {
            defaults.set(score, forKey: "theScore")
            highscoreOutlet.text = "Highscore: \(score)"
            
        }
        let alert = UIAlertController(title: "you died!", message: "hahaha", preferredStyle: .alert)

        
        let okAction = UIAlertAction(title: "okay", style: .default, handler: nil)
        
        alert.addAction(okAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
           self.view.endEditing(true)
           return false
       }
    
    }
    
    
    
    


