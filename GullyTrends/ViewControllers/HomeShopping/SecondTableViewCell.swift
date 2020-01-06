//
//  SecondTableViewCell.swift
//  SampleSwift
//
//  Created by Lakshmi Vajrapu on 16/12/19.
//  Copyright © 2019 Lakshmi Vajrapu. All rights reserved.
//

import UIKit

class SecondTableViewCell: UITableViewCell {

    @IBOutlet var lblTitle: UILabel!
    @IBOutlet weak var secBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
