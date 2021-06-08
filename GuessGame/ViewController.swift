//
//  ViewController.swift
//  GuessGame
//
//  Created by Felipe Marques Ramos on 06/06/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        
        stylizeButton(button: button1)
        stylizeButton(button: button2)
        stylizeButton(button: button3)
        
        askQuestion()

    }

    
    func askQuestion(action : UIAlertAction! = nil){
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)

        title = countries[correctAnswer].uppercased()
    }
    
    func stylizeButton(button: UIButton){
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        var title : String
        
        if sender.tag == correctAnswer{
            title = "correct"
            score += 1
        }
        else{
            title = "wrong"
            score -= 1
        }
        
        let alertController = UIAlertController(title: title, message: "Your Score is \(score)", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
        
        present(alertController, animated: true)
    }
}

