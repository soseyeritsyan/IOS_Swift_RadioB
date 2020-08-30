//
//  StreamTableViewCell.swift
//  RadioDB
//
//  Created by Sose Yeritsyan on 7/5/20.
//  Copyright © 2020 Sose Yeritsyan. All rights reserved.
//

import UIKit
import AVFoundation

class StreamTableViewCell: UITableViewCell {
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var myID: UILabel!
    @IBOutlet weak var playButton: UIButton!
    var player: AVPlayer?
    var stream = Stream()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
    func configure(_ p: Stream) {
        name.text = String(p.streamID)
        myID.text = String(p.quality)
        stream = p
    }
    
    @IBAction func clickPlay(_ sender: UIButton) {
        let url = URL(string: stream.url )
        let playerItem = AVPlayerItem(url: url!)
        player = AVPlayer(playerItem: playerItem)

        player?.play()

    }
    
    
}
