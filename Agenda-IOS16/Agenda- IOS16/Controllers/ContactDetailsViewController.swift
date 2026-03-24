//
//  ContactViewController.swift
//  Agenda- IOS16
//
//  Created by Michael Peralta on 7/15/23.
//

import UIKit
import CoreData

class ContactDetailsViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var lasNameTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    
    var contacts = [Contact]()
    var selectedContact = Contact()


    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setData(contact: selectedContact)
    }

    //MARK: - TableView Delagate Methods

    
    //MARK: - Model Manupulation Methods
    
    func setData(contact: Contact){
        nameTextField.text = contact.name
        lasNameTextField.text = contact.lastName
        phoneNumberTextField.text = contact.phone
    }
}
    
        
