


import UIKit
import  SQLite3

class Util: NSObject {
    
    class func getPath(fileName: String) -> String {
        
       
        
        
        let dbUrl = Bundle.main.url(forResource: "radio_db", withExtension: "sqlite")!
        let dbPath = dbUrl.path
        
        //sharedInstance.database = try! Connection(dbPath)
        /*let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let fileURL = documentsURL.appendingPathComponent(fileName)

        print(fileURL)*/
        return dbPath
    }
    
   
}
