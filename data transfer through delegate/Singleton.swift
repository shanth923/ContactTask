//
//  Singleton.swift
//  data transfer through delegate
//
//  Created by Vidushi Duhan on 01/02/20.
//  Copyright © 2020 Deekonda Venkatesh. All rights reserved.
//

import Foundation


class DBManager:NSObject{
    
    
    static var shared = DBManager()
    
    var names = [String]()
    var number = [String]()
    
     var name1 = ""
     var number1 = ""
    
    
}
