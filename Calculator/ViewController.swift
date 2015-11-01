//
//  ViewController.swift
//  Calculator
//
//  Created by Joseph DeCarlo on 10/28/15.
//  Copyright © 2015 Digital Crafts. All rights reserved.
//

import UIKit

class ViewController: UIViewController, EngineDelegate {
    
    @IBOutlet weak var displayLabel: UILabel!
    
    var engine : Engine?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.engine = Engine(delegate: self)
    }

    
    func engineTotalDidChange(updatedTotal: Float) {
        self.displayLabel.text = String(updatedTotal)
    }
    
    @IBAction func addButtonTouched(sender: AnyObject) {
        
        self.engine?.addOperand(CalculatorOperation.Add)
    }
    
    @IBAction func equalButtonTouched(sender: AnyObject) {
        
        self.engine?.equals()
    }
    
    @IBAction func zeroButtonTouched(sender: AnyObject) {
        
        self.engine?.addDigit(0)
    }
    
    @IBAction func oneButtonTouched(sender: AnyObject) {
        
        self.engine?.addDigit(1)
    }
    
    @IBAction func clearButtonTouched(sender: AnyObject) {
        
        self.engine?.clearDisplay()
    }
    
    @IBAction func allClearButtonTouched(sender: AnyObject) {
        
        self.engine?.clearAll()
    }
    
}

