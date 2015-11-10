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
    ///in the enumeration in the processOperand function
    func addOperand(operand : CalculatorOperation) {
        
        if let last = self.lastOperation {
            
            processOperand(last)
        }
        else {
            
            processOperand(operand)
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
            case .Divide:
                
                self.runningTotal = self.tempTotal / display
                break
            case .Multiply:
                if self.tempTotal == 0 {
                    
                } else {
                    self.runningTotal = self.tempTotal * Float(self.displayTotal)!
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
    
    //MARK:--- Private Functions ---
    private func processOperand(operand: CalculatorOperation) {
        
        switch operand {
        case .Add:
            self.tempTotal = self.tempTotal + Float(self.displayTotal)!
            break
        case .Subtract:
            let display = Float(self.displayTotal)
            if self.tempTotal > display {
                
                self.tempTotal = self.tempTotal - display
            }
            else {
                self.tempTotal = display - self.tempTotal
            }
            
            break
        case .Multiply:
            if self.tempTotal == 0 {
                self.tempTotal = Float(displayTotal)
            } else {
                self.tempTotal = self.tempTotal * Float(displayTotal)
            }
                break
        case .Divide:
            self.tempTotal = self.tempTotal / display
            break
        case .Percentage:
            break
            
        }
        
    }
}
