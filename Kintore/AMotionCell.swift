//
//  AMotionCell.swift
//  Kintore
//
//  Created by superkinoko on 2017/09/20.
//  Copyright © 2017年 kinokodata. All rights reserved.
//

import UIKit

class AMotionCell: UITableViewCell {
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
