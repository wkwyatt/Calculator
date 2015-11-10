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
        self.displayLabel.text = String(stringInterpolationSegment: updatedTotal)
    }
    
    @IBAction func multiplyButtonTouched(sender: AnyObject) {
        self.engine?.addOperand(CalculatorOperation.Multiply)
    }
    
    @IBAction func addButtonTouched(sender: AnyObject) {
        
        self.engine?.addOperand(CalculatorOperation.Add)
    }
    @IBAction func divideButtonTouched(sender: AnyObject) {
        self.engine?.addOperand(CalculatorOperation.Divide)
        
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
    
    @IBAction func twoButtonTouched(sender: UIButton) {
        
        self.engine?.addDigit(2)
    }
    
    @IBAction func threeButtonTouched(sender: AnyObject) {
        self.engine?.addDigit(3)
    }
    
    @IBAction func fourButtonTouched(sender: AnyObject) {
        self.engine?.addDigit(4)
    }
    
    @IBAction func fiveButtonTouched(sender: AnyObject) {
        self.engine?.addDigit(5)
    }
    
    @IBAction func sixButtonTouched(sender: AnyObject) {
        self.engine?.addDigit(6)
    }
    
    @IBAction func sevenButtonTouched(sender: AnyObject) {
        self.engine?.addDigit(7)
    }
    
    @IBAction func eightButtonTouched(sender: AnyObject) {
        self.engine?.addDigit(8)
    }
    
    @IBAction func nineButtonTouched(sender: AnyObject) {
        self.engine?.addDigit(9)
    }
    
    @IBAction func clearButtonTouched(sender: AnyObject) {
        
        self.engine?.clearDisplay()
    }
    
    @IBAction func allClearButtonTouched(sender: AnyObject) {
        
        self.engine?.clearAll()
    }
    @IBAction func decimalButtonTouched(sender: AnyObject) {
//        self.engine?.
    }

    
}

