//
//  Singleton.swift
//  data transfer through delegate
//
//  Created by Vidushi Duhan on 01/02/20.
//  Copyright © 2020 Vidushi Duhan. All rights reserved.
//

import Foundation


class DBManager:NSObject{
    static var shared = DBManager()
    
    var names = [String]()
    var number = [String]()
    var mobileNumber:Int!
    
    var email = [UInt64]()
    
     var name1 = ""
     var number1 = ""
    
    var selectedName = ""
    var selecetedNo = ""
}
