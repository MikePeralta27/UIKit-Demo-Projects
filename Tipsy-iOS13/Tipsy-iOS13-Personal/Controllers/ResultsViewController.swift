//
//  ResultsViewController.swift
//  Tipsy-iOS13-Personal
//
//  Created by Michael Peralta on 11/28/22.
//

import UIKit

class ResultsViewController: UIViewController {
    var amountPerPerson: Float?
    var tipPercent: Float?
    var peopleNum: Int?
    

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
     //   let tipSetting: Int = Int(tipPercent!) * 100
     //   print(tipSetting)
        totalLabel.text = String(format: "%.2f", amountPerPerson ?? 0.00)
        settingsLabel.text = "Split Between \(peopleNum!) with \((tipPercent!) * 100)% Tip."
        // Do any additional setup after loading the view.
    }
    

    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
