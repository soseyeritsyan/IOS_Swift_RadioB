//
//  RadioViewController.swift
//  RadioDB
//
//  Created by Sose Yeritsyan on 7/4/20.
//  Copyright © 2020 Sose Yeritsyan. All rights reserved.
//

import UIKit

class RadioViewController: UIViewController {

    @IBOutlet weak var radioTable: UITableView!
    var countryID = Int()
    var radios = [Radio]()
        
        override func viewDidLoad() {
            super.viewDidLoad()
            let nibCell = UINib(nibName: "RadioTableViewCell", bundle: nil)
            radioTable.register(nibCell, forCellReuseIdentifier: "RadioCell")
            radios = sharedInstance.getRadio(ID: countryID)
        }
    }
        extension RadioViewController: UITableViewDataSource, UITableViewDelegate {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return radios.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            let radio = radios[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "RadioCell", for: indexPath) as! RadioTableViewCell
            cell.accessoryType = .disclosureIndicator
            cell.configure(radio)
            
            return cell

        }
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
                return 150
        }

        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            
            let radio = radios[indexPath.row]
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "StreamViewController") as! StreamViewController
            vc.radio = radio
                
            self.navigationController?.pushViewController(vc, animated: true)

            }

}
