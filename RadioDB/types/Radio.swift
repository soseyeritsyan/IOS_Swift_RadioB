//
//  Radio.swift
//  RadioDB
//
//  Created by Sose Yeritsyan on 7/4/20.
//  Copyright © 2020 Sose Yeritsyan. All rights reserved.
//

import Foundation
class Radio {
    var name: String
    var imageURL: String
    var radioID: Int
    
    init() {
        name = String()
        imageURL = String()
        radioID = Int()
    }
    
    init(name: String, url: String, radioID: Int) {
        self.name = name
        self.imageURL = url
        self.radioID = radioID
    }
}
