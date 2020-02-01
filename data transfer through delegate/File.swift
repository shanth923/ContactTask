//
//  ViewController.swift
//  contactsTask
//
//  Created by Vidushi Duhan on 01/02/20.
//  Copyright © 2020 Vidushi Duhan. All rights reserved.
//

import Foundation
@objc protocol DataPassing {
    
    @objc optional func dataToPass(data:String)
    @objc optional func dataToPass2(lastname:String)

  
}
