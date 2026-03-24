//
//  ViewController.swift
//  Tipsy-iOS13-Personal
//
//  Created by Michael Peralta on 11/26/22.
//

import UIKit

class CalculatorViewController: UIViewController {
    var tipsy = Tipsy()
    var tipsyBrain = TipsyBrain()
//    var tipPercent: Float?
//    var amountPP: Float?

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    @IBAction func tipChanged(_ sender: UIButton) {
        
        billTextField.endEditing(true)
        tipsyBrain.clearTipSelection(uiButton: zeroPctButton)
        tipsyBrain.clearTipSelection(uiButton: tenPctButton)
        tipsyBrain.clearTipSelection(uiButton: twentyPctButton)
        tipsyBrain.selectTip(tipButton: sender)
        tipsy.tipPercent = tipsyBrain.calculateTipPct(tipPct: sender)
        print(tipsy.tipPercent!)
    }
    
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(Int(sender.value))
        
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
    
        tipsy.billAmount = tipsyBrain.getBillAmount(billText: billTextField.text ?? "0.0")
    
        tipsy.peopleNum = tipsyBrain.getPeopleNum(peopleText: splitNumberLabel.text ?? "0")
        
        tipsy.amountPerPerson = tipsyBrain.calculateAmountPP(billAmount: tipsy.billAmount ?? 0, tipPct: tipsy.tipPercent ?? 0.0, people: tipsy.peopleNum ?? 0)
        print(tipsy.amountPerPerson!)
        print(tipsy.billAmount!)
        print(tipsy.tipPercent!)
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "goToResult") {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.amountPerPerson = tipsy.amountPerPerson
            destinationVC.peopleNum = tipsy.peopleNum
            destinationVC.tipPercent = tipsy.tipPercent

        }
    }
    
}
