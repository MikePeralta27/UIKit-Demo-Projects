//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Michael Peralta on 11/25/22.
//  Copyright © 2022 Angela Yu. All rights reserved.
//

import UIKit

struct CalculatorBrain {
    
    
    var bmi: BMI?
    
    mutating func calculateBMI(height: Float, weight: Float) {
        let bmiValue = weight / (height * height)
        
        if bmiValue < 18.5 {
            print(bmiValue)
            print("Underweight")
            bmi = BMI(value: bmiValue, advice: "Eat more pies!", color: UIColor {_ in return #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)} )

        }else if (bmiValue < 24.9){
            print(bmiValue)
            print("Normal")
            bmi = BMI(value: bmiValue, advice: "Fit as fiddle!", color: UIColor {_ in return #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)})

        } else{
            print(bmiValue)
            print("Overweight")
            bmi = BMI(value: bmiValue, advice: "Eat less pies!", color: UIColor {_ in return #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)})
        }
        
         
    }
    
    func getBIMValue() -> String {
        
        let bmiTo1DecimalPlace = String(format: "%.1f", bmi?.value ?? 0.0)
        return bmiTo1DecimalPlace
        
    }
    
    func getAdvice() -> String {
        
        return bmi?.advice ?? "Try Again"
    }
    
    func getColor() -> UIColor {
       
        return bmi?.color ?? UIColor {_ in return #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)}
        
    }
}
