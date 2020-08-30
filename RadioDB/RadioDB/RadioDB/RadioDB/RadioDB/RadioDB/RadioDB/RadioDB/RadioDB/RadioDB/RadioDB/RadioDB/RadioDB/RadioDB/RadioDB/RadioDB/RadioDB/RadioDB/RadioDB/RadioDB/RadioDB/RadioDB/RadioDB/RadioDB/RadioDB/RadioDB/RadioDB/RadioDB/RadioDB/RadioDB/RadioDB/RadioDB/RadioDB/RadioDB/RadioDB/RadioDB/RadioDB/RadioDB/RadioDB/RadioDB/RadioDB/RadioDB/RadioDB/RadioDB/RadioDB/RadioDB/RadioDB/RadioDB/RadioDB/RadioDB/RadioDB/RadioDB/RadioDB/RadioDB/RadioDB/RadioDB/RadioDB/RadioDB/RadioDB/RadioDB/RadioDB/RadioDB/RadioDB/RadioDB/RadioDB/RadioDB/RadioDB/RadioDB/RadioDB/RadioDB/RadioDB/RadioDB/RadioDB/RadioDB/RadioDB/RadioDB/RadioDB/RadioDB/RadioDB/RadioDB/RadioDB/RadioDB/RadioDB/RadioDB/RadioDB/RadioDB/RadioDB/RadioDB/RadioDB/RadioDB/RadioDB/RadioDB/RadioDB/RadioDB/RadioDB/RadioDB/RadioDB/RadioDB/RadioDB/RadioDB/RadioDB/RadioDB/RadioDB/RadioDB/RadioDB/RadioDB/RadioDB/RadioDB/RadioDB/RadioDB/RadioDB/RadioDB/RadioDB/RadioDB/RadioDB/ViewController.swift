//
//  ViewController.swift
//  RadioDB
//
//  Created by Shake Yeritsyan on 7/3/20.
//  Copyright © 2020 Sose Yeritsyan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nibCell = UINib(nibName: "CountryTableViewCell", bundle: nil)
        myTable.register(nibCell, forCellReuseIdentifier: "CountryCell")
        
        
    }
}
    extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountryCell", for: indexPath) as! CountryTableViewCell
        cell.accessoryType = .disclosureIndicator

        cell.configure("user")
        return cell

    }

}

