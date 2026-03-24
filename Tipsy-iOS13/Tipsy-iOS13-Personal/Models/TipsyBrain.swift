//
//  TipsyBrain.swift
//  Tipsy-iOS13-Personal
//
//  Created by Michael Peralta on 12/6/22.
//

import UIKit

struct TipsyBrain{
  
    var tipsy: Tipsy?
    
    
    func clearTipSelection(uiButton:UIButton) {
        uiButton.isSelected = false
    }
    
    func selectTip(tipButton: UIButton){
        tipButton.isSelected = true
    }
    
    mutating func calculateTipPct(tipPct:UIButton) -> Float {
        switch tipPct.currentTitle {
        case "0%":
            
            let pct: Float = 0.0
            return pct
        case "10%":
            let pct: Float = 0.1
            return pct
        case "20%":
            let pct: Float = 0.2
            return pct
        default:
            return 0
        }
    }
    func getBillAmount(billText: String) -> Float{
        let billAmount = Float(billText) ??  0.0
        return billAmount
    }
    
    func getPeopleNum(peopleText: String) -> Int {
       let peopleNum = Int(peopleText) ?? 0
        return peopleNum
    }
    
    func calculateAmountPP(billAmount: Float, tipPct:Float, people: Int) -> Float{
        
        let amountPerPerson = (((billAmount ) * tipPct) + (billAmount)) / Float(people)
        
        return amountPerPerson
    }
    
    
    
    
    
    
    
    
    
    
}
