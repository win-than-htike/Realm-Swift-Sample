//
//  Task.swift
//  Relam-Sample
//
//  Created by Win Than Htike on 11/17/18.
//  Copyright © 2018 PADC. All rights reserved.
//

import UIKit
import RealmSwift

class Task: Object {
    
    @objc dynamic var id = UUID.init().uuidString
    @objc dynamic var name = ""
    
    convenience init(name : String) {
        self.init()
        self.name = name
    }

}
