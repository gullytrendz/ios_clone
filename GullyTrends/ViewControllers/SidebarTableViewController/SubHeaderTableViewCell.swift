//
//  SubHeaderTableViewCell.swift
//  GullyTrends
//
//  Created by Muni on 13/01/20.
//  Copyright © 2020 GullyTrends. All rights reserved.
//

import UIKit

class SubHeaderTableViewCell: UITableViewCell {

  static let reuseIdentifier = "SubHeaderTableViewCell"
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
