//
//  ViewController.swift
//  Flash Chat Personal IOS
//
//  Created by Michael Peralta on 1/19/23.
//

import UIKit
import CLTypingLabel

class WelcomeViewController: UIViewController {

    @IBOutlet weak var titleLable: CLTypingLabel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
        
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.isNavigationBarHidden = false
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        titleLable.text = K.appName
        
//        titleLable.text = ""
//        var charIndex = 0.0
//        let titleText = "⚡️FlashChat"
//        for letter in titleText {
//            print("---")
//            print(0.1 * charIndex)
//            print(letter)
//            Timer.scheduledTimer(withTimeInterval: 0.1 * charIndex, repeats: false) { (timer) in
//                self.titleLable.text?.append(letter)
//            }
//            charIndex += 1
//        }
    }

   

}

