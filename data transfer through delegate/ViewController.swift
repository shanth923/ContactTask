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
class ViewController: UIViewController,DataPassing {
    
    
    let contactStore = CNContactStore()
    var contacts = [ContactStruct]()
    @IBOutlet weak var buttonOutLet: UIButton!
    
    @IBOutlet weak var imageView: UIImageView!
    
    
    @IBOutlet weak var contentView: UIView!
    
    @IBOutlet weak var button1: UIButton!
    
    @IBOutlet weak var button2: UIButton!
    
    @IBOutlet weak var button3: UIButton!
    
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button5: UIButton!
    
    //    @IBOutlet weak var secView: UIView!
    var firstnameData = String()
    var lastnameData = String()
    var ypos = 60
    var number = 0
    var buttonCount = [Int]()
    
    
    override func viewDidLoad() {
           super.viewDidLoad()

        
        
        
                buttonOutLet.layer.cornerRadius = 5
                buttonOutLet.layer.borderWidth = 1
                buttonOutLet.layer.borderColor = UIColor.green.cgColor
           
           imageView.layer.cornerRadius = imageView.frame.width/2
           imageView.clipsToBounds = true
           
        contentView.backgroundColor = .systemGray
        contentView.layer.cornerRadius = contentView.frame.width/6
        contentView.clipsToBounds = true
     buttonUI()
        
        
        // Do any additional setup after loading the view.
       }

    // protocol  dataToPass Function
    
    
    func dataToPass(data: String) {
        ypos = ypos + 40
        number += 1
        firstnameData = data
        var firstnameLbl:UILabel!
        firstnameLbl = UILabel(frame: CGRect.init(x: 10, y: ypos, width: 150, height: 30))
        firstnameLbl.backgroundColor = UIColor.clear
        firstnameLbl.textAlignment = .center
        firstnameLbl.font = firstnameLbl.font.withSize(15)
        contentView.addSubview(firstnameLbl)
        firstnameLbl.text = "\(number).\(DBManager.shared.name1)"
        
        
    }
    
    // protocol  dataToPass2 Function

    
    func dataToPass2(lastname: String) {
        lastnameData = lastname
        var lastnameLbl:UILabel!
        lastnameLbl = UILabel(frame: CGRect.init(x: 160, y: ypos, width: 130, height: 30))
        lastnameLbl.backgroundColor = UIColor.clear
        lastnameLbl.textColor = .white
        lastnameLbl.textAlignment = .left
        lastnameLbl.font = lastnameLbl.font.withSize(15)
        contentView.addSubview(lastnameLbl)
        lastnameLbl.text = DBManager.shared.number1
        
        var button = UIButton()
        button.frame = CGRect(x: 290, y: ypos, width: 50, height: 30)
        button.backgroundColor = .clear
        button.setBackgroundImage(UIImage(named: "icons8-delete-64"), for: UIControl.State.normal)
        contentView.addSubview(button)
       
        if(buttonCount.count < 1){
            button.isHidden = true
        }
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
        
        buttonCount.append(buttonOutLet.tag)
        
        if(buttonCount.count < 6){
          let target = storyboard?.instantiateViewController(identifier: "345") as! ThinrdViewController
              present(target, animated: true, completion: nil)
                  
        
    }else
        {
            
            let alertContrl = UIAlertController.init(title: "Warning", message: "Max 5 contacts Added", preferredStyle: UIAlertController.Style.alert)
            
            let action = UIAlertAction.init(title: "Ok", style: UIAlertAction.Style.cancel, handler: nil)
            alertContrl.addAction(action)
            present(alertContrl, animated: true, completion: nil)
            
            
        }
        
    }
}

