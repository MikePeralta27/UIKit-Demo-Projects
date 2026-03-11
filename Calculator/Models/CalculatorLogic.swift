//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Michael Peralta on 2/25/26.
//  Copyright © 2026 London App Brewery. All rights reserved.
//

import Foundation

struct CalculatorLogic {
    
    private var number: Double?
    
    private var intermedianteCalulation: (n1: Double, calcMethod: String)?
    
    mutating func setNumber(_ number: Double){
        self.number = number
    }
    
    mutating func calculate(symbol: String) -> Double? {
        if let n = number {
            switch symbol {
            case "+/-":
                return -n
            case "AC":
                return 0
            case "%":
                return n / 100
            case "=":
                print("= pressed")
                return performTwoNumCalculation(n2: n)
            default:
                intermedianteCalulation = (n1: n, calcMethod: symbol)
            }
        }
        return nil
    }
    
    private func performTwoNumCalculation(n2: Double) -> Double? {
        if let n1 = intermedianteCalulation?.n1,
           let operation = intermedianteCalulation?.calcMethod {
            switch operation {
            case "+":
                return n1 + n2
            case "-":
                return n1 - n2
            case "×" :
                return n1 * n2
            case "÷":
                return n1 / n2
            default:
                fatalError("error: No valid operation")
            }
        }
        return nil
    }
}
