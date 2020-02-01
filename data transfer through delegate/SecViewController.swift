//
//  ViewController.swift
//  contactsTask
//
//  Created by Vidushi Duhan on 01/02/20.
//  Copyright © 2020 Vidushi Duhan. All rights reserved.
//

import UIKit

class SecViewController: UIViewController {
    
 
    
    weak var delegate: DataPassing? = nil
    
    
    @IBOutlet weak var firstNameTF: UITextField!
    
    
    @IBOutlet weak var mobileNumber: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
// createBtnAction Function
    
    @IBAction func createBtnAction(_ sender: Any) {
        let dataTF = firstNameTF.text
        let data1TF = mobileNumber.text
        
        
        delegate?.dataToPass!(data:dataTF!)
        delegate?.dataToPass2!(lastname: data1TF!)
        
        
        
        dismiss(animated: true) {
            
        }
    }
   

}
