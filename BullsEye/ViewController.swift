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
    
    var currentValue: Int = 0
    var targetValue = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        hitMeButton.addTarget(self, action: #selector(showAlert), for: .touchUpInside)
        startNewRound()
    }

    @objc func showAlert() {
        let difference = calculateDifference()
        let message = "The value of the slider is: \(currentValue)" +
                        "\nThe target value is \(targetValue)" +
                            "\nThe difference is: \(difference)"
        let alert = UIAlertController(title: "Hello, World", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default) {
                _ in
                print("pressed the awesome alert button!")
        }
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
        startNewRound()
    }
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        currentValue = lroundf(slider.value)
    }
    
    func startNewRound() {
        targetValue = Int.random(in: 1...100)
        currentValue = 50
        slider.value = Float(currentValue)
        updateLabels()
    }
    
    func updateLabels() {
        targetLabel.text = String(targetValue)
    }
    
    func calculateDifference() -> Int {
        var difference: Int = 0
        if currentValue > targetValue {
            difference = currentValue - targetValue
        } else if targetValue > currentValue {
            difference = targetValue - currentValue
        } else {
            difference = 0
        }
        
        return difference
    }
}

