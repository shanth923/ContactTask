//
//  ThinrdViewController.swift
//  data transfer through delegate
//
//  Created by Vidushi Duhan on 01/02/20.
//  Copyright © 2020 Deekonda Venkatesh. All rights reserved.
//

import UIKit
import Contacts

class ThinrdViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var delegate12:DataPassing!
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell.init(style: .subtitle, reuseIdentifier: nil)
        let contactToDspaly = contacts[indexPath.row]
        cell.textLabel?.text = contactToDspaly.name
        cell.detailTextLabel?.text = contactToDspaly.number
        
        return cell
    }
    

    @IBOutlet weak var tableView3: UITableView!
    
     let contactStore = CNContactStore()
     var contacts = [ContactStruct]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView3.delegate = self
        tableView3.dataSource = self
        
        
        contactStore.requestAccess(for: .contacts) { (success, error) in
        print("authorization successful")
            
            self.fetchContacts()
        // Do any additional setup after loading the view.
    }
    }
    
    
    
    func fetchContacts(){
        
        
        
        let key = [CNContactGivenNameKey,CNContactPhoneNumbersKey] as [CNKeyDescriptor]
        let request = CNContactFetchRequest(keysToFetch: key)
        
        try! contactStore.enumerateContacts(with: request) { (contact, stoppingPointer) in
            let name = contact.givenName
            let number = contact.phoneNumbers.first?.value.stringValue
            let contactToAppend = ContactStruct(name: name, number: number!)
            self.contacts.append(contactToAppend)
            
            DBManager.shared.names.append(name)
            DBManager.shared.number.append(number!)
            
        }
        
        tableView3.reloadData()
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        dismiss(animated: true, completion: nil)
        
        var singleName = DBManager.shared.names[indexPath.row]
        var singleNumber = DBManager.shared.number[indexPath.row]
        
        
         singleName    =     DBManager.shared.name1
        singleNumber   =   DBManager.shared.number1
        
                delegate12.dataToPass!(data:(DBManager.shared.name1))
                delegate12.dataToPass2!(lastname:    DBManager.shared.number1)
        
       
        
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
