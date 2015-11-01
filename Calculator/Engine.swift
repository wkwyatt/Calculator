//
//  Engine.swift
//  Calculator
//
//  Created by Joseph DeCarlo on 10/28/15.
//  Copyright © 2015 DigitalCrafts. All rights reserved.
//

import Foundation

enum CalculatorOperation {
    
    case Multiply
    case Divide
    case Add
    case Subtract
    case Percentage
}

protocol EngineDelegate {
    func engineTotalDidChange(updatedTotal:Float)
}

class Engine {
    
    let displayZero = "0"
    
    var runningTotal : Float = 0.0 {
        didSet {
            print("runningTotal: \(runningTotal)")
        }
    }
    var tempTotal : Float {
        didSet {
            print("tempTotal: \(tempTotal)")
        }
    }
    var displayTotal : String
    
    init(delegate : EngineDelegate) {
        self.displayTotal = self.displayZero
        self.tempTotal = 0.0
        self.delegate = delegate
    }
    
    var delegate : EngineDelegate
    var lastOperation : CalculatorOperation?
    
    func addDigit(digit : Int) {
        
        if self.displayTotal == self.displayZero {
            
            self.displayTotal = String(digit)
        }
        else {
        
            self.displayTotal += String(digit)
        }
        
        self.delegate.engineTotalDidChange(Float(self.displayTotal)!);
    }
    
    ///You will have to complete the other functions present
    ///in the enumeration
    func addOperand(operand : CalculatorOperation) {
        
        switch operand {
        case .Add:
            self.tempTotal = self.tempTotal + Float(self.displayTotal)!
            break
        case .Subtract:
            let display = Float(self.displayTotal)!
            if self.tempTotal > display {
                
                self.tempTotal = self.tempTotal - display
            }
            else {
                self.tempTotal = display - self.tempTotal
            }
            break
        default:
            break
        }
        
        self.lastOperation = operand
        self.delegate.engineTotalDidChange(self.tempTotal)
        self.displayTotal = self.displayZero
    }
    
    ///You will have to complete the other functions present
    ///in the enumeration
    func equals() {

        if let lastOp = self.lastOperation {

            switch lastOp {
            case .Add:
                self.runningTotal = self.tempTotal + Float(self.displayTotal)!
                break
            case .Subtract:
                let display = Float(self.displayTotal)!
                if self.tempTotal > display {

                    self.runningTotal = self.tempTotal - display
                }
                else {
                    self.runningTotal = display - self.tempTotal
                }

                break
            default:
                break
            }
        }
        
        self.tempTotal = 0.0
        self.displayTotal = self.displayZero
        self.lastOperation = nil
        self.delegate.engineTotalDidChange(self.runningTotal)

    }
    
    func clearAll () {
        
        self.runningTotal = 0.0
        self.tempTotal = 0.0
        self.displayTotal = self.displayZero
        self.lastOperation = nil
        
        
        self.delegate.engineTotalDidChange(self.runningTotal)
    }
    
    func clearDisplay() {
        
        self.displayTotal = self.displayZero
    }
}
