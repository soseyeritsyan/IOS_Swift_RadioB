//
//  Country.swift
//  RadioDB
//
//  Created by Sose Yeritsyan on 7/4/20.
//  Copyright © 2020 Sose Yeritsyan. All rights reserved.
//

import Foundation
class Country {
    var name: String
    var flag: String
    var ID: Int
    
    init() {
        name = String()
        flag = String()
        ID = Int()
    }
    
    init(name: String, flag: String, id: Int) {
        self.name = name
        self.flag = flag
        self.ID = id
    }
}
