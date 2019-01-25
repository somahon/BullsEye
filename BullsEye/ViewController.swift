//
//  ViewController.swift
//  BullsEye
//
//  Created by Shane O'Mahony on 11/01/2019.
//  Copyright © 2019 Shane O'Mahony. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var hitMeButton: UIButton!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    
    var currentValue: Int = 0
    var targetValue = 0
    var score = 0
    var currentRound = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        hitMeButton.addTarget(self, action: #selector(showAlert), for: .touchUpInside)
        startNewRound()
    }

    @objc func showAlert() {
        let difference = abs(currentValue - targetValue)
        var points = 100 - difference
        
        let title: String
        if difference == 0 {
            title = "Perfect!"
            points += 100 //bonus points for perfect score
        } else if difference < 5 {
            title = "You almost had it!"
        } else if difference < 10 {
            title = "Pretty good!"
        } else {
            title = "Not even close..."
        }
        score += points
        let message = "You scored \(points) points"
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default) {
            _ in
            self.startNewRound()
        }
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        currentValue = lroundf(slider.value)
    }
    
    func startNewRound() {
        targetValue = Int.random(in: 1...100)
        currentValue = 50
        slider.value = Float(currentValue)
        currentRound += 1
        updateLabels()
    }
    
    func updateLabels() {
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(currentRound)
    }
    
    @IBAction func startOver() {
        currentRound = 0
        score = 0
        startNewRound()
    }
}

