//
//  CountryTableViewCell.swift
//  RadioDB
//
//  Created by Sose Yeritsyan on 7/3/20.
//  Copyright © 2020 Sose Yeritsyan. All rights reserved.
//

import UIKit
import SDWebImage


class CountryTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var countryInage: UIImageView!
  //  @IBOutlet weak var flagLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(_ p: Country) {
        nameLabel.text = p.name
        countryInage.sd_setImage(with: URL(string: p.flag), placeholderImage: UIImage(named: "country.png"))
    }
    
}
