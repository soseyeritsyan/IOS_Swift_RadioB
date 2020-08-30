//
//  UsingFMDB.swift
//  UsinfFMDB
//
//  Created by Sose Yeritsyan on 6/15/20.
//  Copyright © 2020 Sose Yeritsyan. All rights reserved.
//


/*
 first implement FMDB with pod file
 after I don't need to create bridging header file
 in build settings change if need
    swift compiler general -> objective c bridging header

*/
import Foundation
import  FMDB
let sharedInstance = FMDBDSharedInstance()

class FMDBDSharedInstance {
    
    private let dbFileName = "radio_db.sqlite"
    private var database:FMDatabase!

    init() {
        openDatabase()
    }
    

    func openDatabase() {
        
        
        let bundlePath = Bundle.main.path(forResource: "radio_db", ofType: ".sqlite")
        let destPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let fileManager = FileManager.default
        let fullDestPath = URL(fileURLWithPath: destPath).appendingPathComponent("radio_db.sqlite")
        if fileManager.fileExists(atPath: fullDestPath.path){
            print("Database file is exist")
            print(fileManager.fileExists(atPath: bundlePath!))
        }else{
            do{
                try fileManager.copyItem(atPath: bundlePath!, toPath: fullDestPath.path)
            }catch{
                print("\n",error)
            }
        }

        let database = FMDatabase(url: fullDestPath)

        if (!database.open()) {
            print("Could not open database at \(fullDestPath).")
        } else {
            self.database = database
        }
    }
    
    func getCounrty() -> [Country] {
        sharedInstance.database!.open()
        //database?.setKey(key)

        var returnedCountrys = [Country]()
        let resultSet:FMResultSet! = sharedInstance.database!.executeQuery("SELECT * FROM country", withArgumentsIn: [0])

        if (resultSet != nil) {
            while resultSet.next() {

                let item = Country()
                item.name = String(resultSet.string(forColumn: "name")!)
                item.flag = String(resultSet.string(forColumn: "flag_url")!)
                item.ID = Int(resultSet.int(forColumn: "id"))
                
                returnedCountrys.append(item)
            }
        }
        
        sharedInstance.database!.close()
        return returnedCountrys
    }
    func getRadio(ID: Int) -> [Radio] {
        sharedInstance.database!.open()
        //database?.setKey(key)

        var returnedRadios = [Radio]()
        let resultSet:FMResultSet! = sharedInstance.database!.executeQuery("SELECT * FROM radio WHERE country = ?",  withArgumentsIn: [ID])

        if (resultSet != nil) {
            while resultSet.next() {
                let item = Radio()
                item.name = String(resultSet.string(forColumn: "name")!)
                item.imageURL = String(resultSet.string(forColumn: "image_url")!)
                item.radioID = Int(resultSet.int(forColumn: "id"))
                
                returnedRadios.append(item)
            }
        }
        
        sharedInstance.database!.close()
        return returnedRadios
    }
        
    
    func getStream(ID: Int) -> [Stream] {
        sharedInstance.database!.open()
        //database?.setKey(key)

        var returnedStreams = [Stream]()
        let resultSet:FMResultSet! = sharedInstance.database!.executeQuery("SELECT * FROM stream WHERE radio = ?",  withArgumentsIn: [ID])

        if (resultSet != nil) {
            while resultSet.next() {
                let item = Stream()
                item.streamID = Int(resultSet.int(forColumn: "id"))
                item.radioID = Int(resultSet.int(forColumn: "radio"))
                item.quality = Int(resultSet.int(forColumn: "quality"))
                item.url = String(resultSet.string(forColumn: "url")!)
                item.rank = Int(resultSet.int(forColumn: "rank"))
                
                returnedStreams.append(item)
            }
        }

        sharedInstance.database!.close()
        return returnedStreams
    }
}
