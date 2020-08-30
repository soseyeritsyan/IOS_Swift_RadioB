//
//  ViewController.swift
//  RadioDB
//
//  Created by Sose Yeritsyan on 7/3/20.
//  Copyright © 2020 Sose Yeritsyan. All rights reserved.
//

import UIKit

class CountryViewController: UIViewController {

    @IBOutlet weak var myTable: UITableView!
    var countrys = [Country]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        countrys = sharedInstance.getCounrty()
        let nibCell = UINib(nibName: "CountryTableViewCell", bundle: nil)
        myTable.register(nibCell, forCellReuseIdentifier: "CountryCell")
        
    }
}
    extension CountryViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countrys.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let country = countrys[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountryCell", for: indexPath) as! CountryTableViewCell
        cell.accessoryType = .disclosureIndicator
        cell.configure(country)
        
        return cell

    }
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
                    return 120
        }

        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            
            let country = countrys[indexPath.row]
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "RadioViewController") as! RadioViewController
            vc.countryID = country.ID
            self.navigationController?.pushViewController(vc, animated: true)

        }
}

