//
//  CalcVC.swift
//  Calculator
//
//  Created by akhil mantha on 17/06/17.
//  Copyright © 2017 akhil mantha. All rights reserved.
//

import UIKit

class CalcVC: UIViewController {
    
    //reference + % - x 

    @IBOutlet weak var display: UILabel!
    var displayValue : Double {
        
        get {
           return Double(display.text!)!
        }
        
        set {
            display.text = "\(newValue)"
        }
        
        }
    
    var userIsTypingNumber = false
    var numberOne : Double = 0
    var numberTwo : Double = 0
    var currentOperator = ""
    let defaults  = NSUserDefaults.standardUserDefaults()
    var saveNumber : Double  = 0
    var memoryType = ""
    var tax : Double = 0
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func digitTapped(sender: UIButton) {
        
        let digit = sender.currentTitle
        if userIsTypingNumber == false {
            display.text = ""
            display.text = digit
            userIsTypingNumber = true
        } else if userIsTypingNumber == true {
            display.text = display.text! + digit!
        }
        
        
    }

    @IBAction func operatorTapped(sender: UIButton) {
        //reference + % - x
        userIsTypingNumber = false
        currentOperator = sender.currentTitle!
        if numberOne == 0 && numberTwo == 0 {
            switch currentOperator {
            case  "➗" :
                currentOperator = "/"
                numberOne = displayValue
            case "✖️" :
                currentOperator = "*"
                numberOne  = displayValue
            case "➖" :
                currentOperator = "-"
                numberOne = displayValue
            case "➕" :
                currentOperator = "+"
                numberOne = displayValue
            default:
                break
            
            }
        }else if numberOne != 0 && numberTwo == 0 {
            switch currentOperator {
            case  "➗" :
                currentOperator = "/"
                numberTwo = displayValue
                displayValue = numberOne / numberTwo
                numberOne = displayValue
                numberTwo = 0
            case "✖️" :
                currentOperator = "*"
                numberTwo  = displayValue
                displayValue = numberOne * numberTwo
                numberOne = displayValue
                numberTwo = 0
            case "➖" :
                currentOperator = "-"
                numberTwo = displayValue
                displayValue = numberOne - numberTwo
                numberOne = displayValue
                numberTwo = 0
            case "➕" :
                currentOperator = "+"
                numberTwo = displayValue
                displayValue = numberOne + numberTwo
                numberOne = displayValue
                numberTwo = 0
            default:
                break

                
                
                
            }
            
        }
        

        
        
    }
    
    @IBAction func sqrtTapped(sender: AnyObject) {
        
        displayValue = sqrt(displayValue)
        
        
    }
    
    @IBAction func percTapped(sender: AnyObject) {
        
        numberTwo = displayValue
        if currentOperator == "+" || currentOperator == "-"
        {
            displayValue = (numberTwo/100) * numberOne
        }else if currentOperator == "/" || currentOperator == "*"{
           displayValue = (numberTwo/100)
        }
    }
    @IBAction func equalTapped(sender: AnyObject) {
        
        userIsTypingNumber = false
        numberTwo = displayValue
        
        if currentOperator == "/" {
            displayValue = numberOne / numberTwo
        }else if currentOperator == "*" {
            displayValue = numberOne * numberTwo
        }else if currentOperator == "-" {
            displayValue = numberOne - numberTwo
        }else if currentOperator == "+" {
            displayValue = numberOne - numberTwo
        }
        numberOne = displayValue
        
    }

    @IBAction func minus10perc(sender: AnyObject) {
        
        userIsTypingNumber = false
        displayValue = displayValue * (90/100)
        
        
    }

    @IBAction func plusTax(sender: AnyObject) {
        
        userIsTypingNumber = false
        tax = defaults.doubleForKey("taxrate")
        displayValue = (displayValue + (displayValue * (tax/100)))
        
        
        
    }

    @IBAction func memoryTapped(sender: UIButton) {
        
        memoryType = sender.currentTitle!
        
        switch memoryType {
            
        case "M+" :
            saveNumber = saveNumber + displayValue
            defaults.setDouble(saveNumber, forKey: "saved")
        case "M-":
            saveNumber = saveNumber - displayValue
            defaults.setDouble(saveNumber, forKey: "saved")
        case "MR":
            displayValue = defaults.doubleForKey("saved")
            display.text = String(displayValue)
        case "MC":
            defaults.removeObjectForKey("saved")
            display.text = "0"
        case "CA":
            defaults.removeObjectForKey("saved")
            clearTapped(self)
        default:
            break
            
        }
        
        
    }

    @IBAction func clearTapped(sender: AnyObject) {
        
        currentOperator = ""
        numberOne = 0
        numberTwo = 0
        displayValue = 0
        display.text = "0"
        userIsTypingNumber = false
        
        
        
        
    }
    
    
}













