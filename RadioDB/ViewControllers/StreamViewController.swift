//
//  StreamViewController.swift
//  RadioDB
//
//  Created by Sose Yeritsyan on 7/5/20.
//  Copyright © 2020 Sose Yeritsyan. All rights reserved.
//

import UIKit
import SDWebImage

class StreamViewController: UIViewController {

    @IBOutlet weak var streamTable: UITableView!
    //var s = Stream()
    var radio = Radio()
    //var radioID = Int()
    var streams = [Stream]()
    
    @IBOutlet weak var radioImage: UIImageView!
    @IBOutlet weak var radioID: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nibCell = UINib(nibName: "StreamTableViewCell", bundle: nil)
        streamTable.register(nibCell, forCellReuseIdentifier: "StreamCell")
        streams = sharedInstance.getStream(ID: radio.radioID)
        radioImage.sd_setImage(with: URL(string: radio.imageURL), placeholderImage: UIImage(named: "radioimg.png"))

        radioID.text = String(radio.radioID)
        
            }
        }


    extension StreamViewController: UITableViewDataSource, UITableViewDelegate {
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
                streams.count
        }
            
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                
            let cell = tableView.dequeueReusableCell(withIdentifier: "StreamCell", for: indexPath) as! StreamTableViewCell
            cell.configure(streams[indexPath.row])
                
            return cell
        }
        
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
                    return 68
        }

    
    }
