//
//  OperatingSystemTableViewCell.swift
//  Advanced Codable
//
//  Created by Grant Maloney on 2/17/19.
//  Copyright © 2019 Grant Maloney. All rights reserved.
//

import UIKit

class ClassesTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var timeFrameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
