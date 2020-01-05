//
//  MainViewCell.swift
//  GullyTrends
//
//  Created by karna on 05/01/20.
//  Copyright © 2020 GullyTrends. All rights reserved.
//

import UIKit

class MainViewCell: UICollectionViewCell {
    
    static let reuseIdentifier = "cellIdentifier"
    
    lazy var imgBackGround: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "best-kids-clothing.jpg")
        image.layer.cornerRadius = 10
        if (image.layer.cornerRadius > 0) {
            image.layer.masksToBounds = true
        }
        return image
    }()
    override func prepareForReuse() {
        super.prepareForReuse()
        self.configure()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func configure() {
        self.backgroundView = imgBackGround
    }
}
