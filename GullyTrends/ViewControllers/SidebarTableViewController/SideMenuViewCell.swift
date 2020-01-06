//
//  SideMenuViewCell.swift
//  GullyTrends
//
//  Created by karna on 05/01/20.
//  Copyright © 2020 GullyTrends. All rights reserved.
//

import UIKit

class SideMenuViewCell: UITableViewCell {
    static let reuseIdentifier = "title"
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    func configure(text: String) {
        self.contentView.backgroundColor = UIColor(red: 80.0 / 255.0, green: 24 / 255.0, blue: 133 / 255.0, alpha: 1.0)
        self.textLabel?.textColor = UIColor.white
        self.textLabel?.text = "\(            text)"
    }
    
}
