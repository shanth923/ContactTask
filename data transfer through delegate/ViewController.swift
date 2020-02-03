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
@available(iOS 13.0, *)
class ViewController: UIViewController {
    
    @IBOutlet weak var contactsTV: UITableView!
    
    var contactsTVData = [String]()
    
    let contactStore = CNContactStore()
    var contacts = [ContactStruct]()
    @IBOutlet weak var buttonOutLet: UIButton!
    
    @IBOutlet weak var imageView: UIImageView!
    
    var allDeleteButtons = [UIButton]()
    
    //@IBOutlet weak var contentView: UIView!
    
    @IBOutlet weak var button1: UIButton!
    
    @IBOutlet weak var button2: UIButton!
    
    @IBOutlet weak var button3: UIButton!
    
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button5: UIButton!
    
    var buttonTag = 0
    
    var allLastNameLabels = [UILabel]()
    var allNumberlabels = [UILabel]()
    //    @IBOutlet weak var secView: UIView!
    var firstnameData = String()
    var lastnameData = String()
    var ypos = 60
    var number = 0
    var buttonCount = 0
    
    
    
    
    override func viewDidLoad() {
           super.viewDidLoad()

        configureTableView()
        
        
    buttonOutLet.layer.cornerRadius = 8
    buttonOutLet.layer.borderWidth = 1
    buttonOutLet.layer.borderColor = UIColor.black.cgColor
           
           imageView.layer.cornerRadius = imageView.frame.width/2
           imageView.clipsToBounds = true
           
        //contentView.backgroundColor = .green
        //contentView.layer.cornerRadius = contentView.frame.width/6
        //contentView.clipsToBounds = true
     buttonUI()
        
        
        // Do any additional setup after loading the view.
       }
        
    func buttonUI(){
        
        button1.layer.cornerRadius = button1.frame.width/2
        button1.clipsToBounds = true
     
        button2.layer.cornerRadius = button2.frame.width/2
        button2.clipsToBounds = true
        
        button3.layer.cornerRadius = button3.frame.width/2
        button3.clipsToBounds = true
        
        button4.layer.cornerRadius = button4.frame.width/2
        button4.clipsToBounds = true
        
        button5.layer.cornerRadius = button5.frame.width/2
        button5.clipsToBounds = true
        }
    
//
//    override func viewWillAppear(_ animated: Bool) {
//        if(buttonCount.count < 1){
//
//            nameLabel1.isHidden = true
//            buttn.isHidden = true
//
//
//        }
    
    // addBtnAction function
    
    @available(iOS 13.0, *)
    @IBAction func addBtnAction(_ sender: Any) {
        
        if(buttonCount < 5){
          let target = storyboard?.instantiateViewController(identifier: "345") as! ThinrdViewController
            target.view1Reference = self
            
              present(target, animated: true, completion: nil)
            
            buttonCount += 1
                  
        
    }else
        {
            
            let alertContrl = UIAlertController.init(title: "Warning", message: "Max 5 contacts Added", preferredStyle: UIAlertController.Style.alert)
            
            let action = UIAlertAction.init(title: "Ok", style: UIAlertAction.Style.cancel, handler: nil)
            alertContrl.addAction(action)
            present(alertContrl, animated: true, completion: nil)
            
            
        }
         
        
    }
}


@available(iOS 13.0, *)
extension ViewController:UITableViewDelegate,UITableViewDataSource
{
    func reloadTableView()
    {
        contactsTV.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return contactsTVData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
       
            
            
            cell.textLabel?.text = contactsTVData[indexPath.row]
            
            cell.textLabel?.numberOfLines = 0
        cell.backgroundColor = .clear
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if(editingStyle == .delete)
        {
            contactsTVData.remove(at: indexPath.row)
            buttonCount -= 1
            print(buttonCount)
            reloadTableView()
        }
    }
    
    func configureTableView()
    {
        
        contactsTV.backgroundColor = .clear
        contactsTV.delegate = self
        contactsTV.dataSource = self
    }
}

