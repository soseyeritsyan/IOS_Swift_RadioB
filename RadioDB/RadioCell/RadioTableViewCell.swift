//
//  RadioTableViewCell.swift
//  RadioDB
//
//  Created by Sose Yeritsyan on 7/4/20.
//  Copyright © 2020 Sose Yeritsyan. All rights reserved.
//

import UIKit
import SDWebImage

class RadioTableViewCell: UITableViewCell {
    
    @IBOutlet weak var name: UILabel!

    @IBOutlet weak var radioIMG: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(_ p: Radio ) {
        name.text = p.name
        radioIMG.sd_setImage(with: URL(string: p.imageURL), placeholderImage: UIImage(named: "radio.png"))
        /*let imageUrlString = p.imageURL
        guard let imageUrl:URL = URL(string: imageUrlString) else {
            return
        }
        guard ((try? radioIMG?.image = UIImage(data: Data(contentsOf: imageUrl))) != nil) else {
          return
        }
        //radioIMG?.image = UIImage(data: Data(contentsOf: imageUrl))
        
        /*let url = URL(string: p.imageURL)!

        if let data = try? Data(contentsOf: url) {
            // Create Image and Update Image View

            radioIMG?.image = UIImage(data: data)
        }*/*/
    }
    
}
