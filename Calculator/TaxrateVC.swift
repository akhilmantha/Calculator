//
//  TaxrateVC.swift
//  Calculator
//
//  Created by akhil mantha on 17/06/17.
//  Copyright © 2017 akhil mantha. All rights reserved.
//

import UIKit

class TaxrateVC: UIViewController {
    
    
    
    @IBOutlet weak var taxRateEntry: UITextField!
    let defaults = NSUserDefaults.standardUserDefaults()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func applyTaxRate(sender: AnyObject) {
        if taxRateEntry.text != nil{
            defaults.setDouble(Double(taxRateEntry.text!)!,forKey: "taxrate")
            dismissViewControllerAnimated(true, completion: nil)
        }else {
            dismissViewControllerAnimated(true, completion: nil)
        }
        
        
        
    }

    
}
