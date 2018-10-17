//
//  ViewController.swift
//  Calculator
//
//  Created by Denver Stove on 15/10/18.
//  Copyright © 2018 Denver Stove. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var display: UILabel!
    
    var userIsInTheMiddleOfTyping = false
    
    @IBAction func touchDigit(_ sender: UIButton) {
        let digit = sender.currentTitle!
        if userIsInTheMiddleOfTyping {
            let textCurrentlyInDisplay = display.text!
            display.text = textCurrentlyInDisplay + digit
        } else {
            display.text = digit
            userIsInTheMiddleOfTyping = true
        }
    }
    
    var displayValue: Double {
        get {
          return Double(display.text!)!
        }
        set {
            display.text = String(newValue)
        }
    }
    
    @IBAction func performOperation(_ sender: UIButton) {
        userIsInTheMiddleOfTyping = false
        if let mathemitcalSymbol = sender.currentTitle {
            switch mathemitcalSymbol {
            case "∏":
                displayValue = Double.pi
            case "√":
               displayValue = sqrt(displayValue)
            default:
                break
            }
        }
    }
    
}

