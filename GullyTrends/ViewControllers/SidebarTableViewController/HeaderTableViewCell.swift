//
//  HeaderTableViewCell.swift
//  GullyTrends
//
//  Created by Muni on 07/01/20.
//  Copyright © 2020 GullyTrends. All rights reserved.
//

import UIKit

class HeaderTableViewCell: UITableViewCell {

  static let reuseIdentifier = "HeaderTableViewCell"

  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var logoIV: UIImageView!
  
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
