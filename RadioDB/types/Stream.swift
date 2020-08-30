//
//  Stream.swift
//  RadioDB
//
//  Created by Sose Yeritsyan on 7/5/20.
//  Copyright © 2020 Sose Yeritsyan. All rights reserved.
//

import Foundation
class Stream {
    var streamID: Int
    var radioID: Int
    var quality: Int
    var url: String
    var rank: Int
    //var radio:Radio
    //var imageURL: String
    //var status: String
    
    init() {
        streamID = Int()
        radioID = Int()
        quality = Int()
        url = String()
        rank = Int()
        //imageURL = String()
       // status = String()
    }
    
    init( streamID: Int, radioID: Int, q: Int, url: String, r: Int) {//name: Int, radio: Radio){//}, url: String, status: String) {
        self.streamID = streamID
        self.radioID = radioID
        self.quality = q
        self.url = url
        self.rank = r
        //self.imageURL = url
        //self.status = status
    }
}
//http://provisioning.streamtheworld.com/pls/KOSIFMAAC.pls
