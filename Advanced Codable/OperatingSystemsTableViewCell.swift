//
//  OperatingSystemsTableViewCell.swift
//  Advanced Codable
//
//  Created by Grant Maloney on 2/17/19.
//  Copyright © 2019 Grant Maloney. All rights reserved.
//

import UIKit

class OperatingSystemsTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var headLabel: UILabel!
    @IBOutlet weak var middleLabel: UILabel!
    @IBOutlet weak var bottomLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func update(title: String, head: String, middle: String, bottom: String) {
        self.titleLabel.text = title
        self.headLabel.text = head
        self.middleLabel.text = middle
        self.bottomLabel.text = bottom
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
