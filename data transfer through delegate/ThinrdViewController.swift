//
//  ViewController.swift
//  contactsTask
//
//  Created by Vidushi Duhan on 01/02/20.
//  Copyright © 2020 Vidushi Duhan. All rights reserved.
//
import UIKit
import Contacts

@available(iOS 13.0, *)
class ThinrdViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var view1Reference:ViewController!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell.init(style: .subtitle, reuseIdentifier: nil)
        let contactToDspaly = contacts[indexPath.row]
        cell.textLabel?.text = contactToDspaly.name
        cell.detailTextLabel?.text = contactToDspaly.number
        cell.backgroundColor = .clear
        
        
        return cell
    }
    

    @IBOutlet weak var tableView3: UITableView!
    
     let contactStore = CNContactStore()
     var contacts = [ContactStruct]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView3.delegate = self
        tableView3.dataSource = self
        tableView3.backgroundColor = .clear
        
        
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

    var mobile:Int!
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        dataReq(id: "5e26ea82dcef130017295cd9")
       
        var isDuplicateValue = false
        DBManager.shared.selectedName = DBManager.shared.names[indexPath.row]
        DBManager.shared.selecetedNo = DBManager.shared.number[indexPath.row]
        
        var value1 = "()-"
        let removeslashes = DBManager.shared.selecetedNo.replacingOccurrences(of: " ", with: "", options: .literal, range: nil)

        let removeslashes2 = removeslashes.replacingOccurrences(of: "-", with: "", options: .literal, range: nil)
       let value2 = removeslashes2.replacingOccurrences(of: "(", with: "", options: .literal, range: nil)
        let value3 = value2.replacingOccurrences(of: ")", with: "", options: .literal, range: nil)
       print("@@@@@@\(value3)")
        
        DBManager.shared.mobileNumber = Int(value3)
        
//        print(DBManager.shared.mobileNumber)
        
        for x in view1Reference.contactsTVData
        {
            if(x == DBManager.shared.selectedName + "\n" + DBManager.shared.selecetedNo)
            {
                isDuplicateValue = true
            }
        }
        
      if(!isDuplicateValue)
      {
view1Reference.contactsTVData.append(DBManager.shared.selectedName + "\n" + DBManager.shared.selecetedNo)
                
                  view1Reference.reloadTableView()
         dataTask()
        
        }
        else
      {
                let alertContrl = UIAlertController.init(title: "Warning", message: "Contact Already Added", preferredStyle: UIAlertController.Style.alert)
                   
                   let action = UIAlertAction.init(title: "Ok", style: UIAlertAction.Style.cancel, handler: nil)
                   alertContrl.addAction(action)
        
        self.present(alertContrl, animated: true, completion: nil)

        
        }
        
    }
    
   
//    func dataReq(id:String){
//
//        let parametersMain = "{[\n\t{\n\t\t\"name\":\"grdfhg\",\n\t\t\"phone\":12345678}\n\t\t]\n}"
//
//        let parameters = "{[name:shanth,phone:9493215373]}"
//
//        var URLReq = URLRequest(url: URL(string:"https://osos-testing.herokuapp.com/api/user/emergencycontact/\(id)")!)
//
//               URLReq.httpMethod = "PUT"
//      let postData = parameters.data(using: .utf8)
////        URLReq.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
//
//        URLReq.httpBody = postData
//        URLReq.addValue("application/json", forHTTPHeaderField: "Content-Type")
//
//        let dataTask = URLSession.shared.dataTask(with: URLReq) { (data, response, error) in
//
//            do {
//                let response = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments)
//                print(response)
//
//            }
//            catch{
//
//                print("not working api")
//
//            }
//
//
//
//        }
//
//            dataTask.resume()
//        }
    
// dataSending to server
    
  func dataTask()
    
  {
    let parameters = "[\n\t{\n\t\t\"name\":\"\(DBManager.shared.selectedName)\",\n\t\t\"phone\":\(DBManager.shared.mobileNumber!)\n\t}\n]\n"
    
      let postData = parameters.data(using: .utf8)

      var request = URLRequest(url: URL(string: "http://osos-testing.herokuapp.com/api/user/emergencycontact/5e26ea82dcef130017295cd9")!)
      request.addValue("application/json", forHTTPHeaderField: "Content-Type")

      request.httpMethod = "PUT"
      request.httpBody = postData

      let task = URLSession.shared.dataTask(with: request) { data, response, error in
        guard let data = data else {
          print(String(describing: error))
          return
        }
        
        print(String(data: data, encoding: .utf8)!)
        }
        
      task.resume()
    let alertContrl = UIAlertController.init(title: "Success!", message: "Successfully Data Sent", preferredStyle: UIAlertController.Style.alert)
           
           let action = UIAlertAction.init(title: "Ok", style: UIAlertAction.Style.cancel, handler: nil)
    
    let actionz = UIAlertAction.init(title: "OK", style: UIAlertAction.Style.cancel) { (dissmiss) in
        
        self.dismiss(animated: true, completion: nil)
        
    }
           alertContrl.addAction(actionz)
           self.present(alertContrl, animated: true, completion: nil)
           
    
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
