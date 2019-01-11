//
//  ViewController.swift
//  BullsEye
//
//  Created by Shane O'Mahony on 11/01/2019.
//  Copyright © 2019 Shane O'Mahony. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var hitMeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        hitMeButton.addTarget(self, action: #selector(showAlert), for: .touchUpInside)
    }

    @objc func showAlert() {
        let alert = UIAlertController(title: "Hello, World", message: "This is my first message!", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Awesome", style: .default) {
                _ in
                print("pressed the awesome alert button!")
        }
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
    
}

