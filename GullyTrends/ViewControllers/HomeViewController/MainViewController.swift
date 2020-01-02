//
//  MainViewController.swift
//  GullyTrends
//
//  Created by karna on 01/01/20.
//  Copyright © 2020 GullyTrends. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var productscollectionView: UICollectionView!
    @IBOutlet weak var sidebarButton: UIBarButtonItem!
    
    var widthArr = [CGFloat]()
    var heightArr = [CGFloat]()
    lazy var image = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        widthArr = [(UIScreen.main.bounds.size.width/2)-20,
                    (UIScreen.main.bounds.size.width/2)-20,
                    (UIScreen.main.bounds.size.width)-30,
                    (UIScreen.main.bounds.size.width)-30,
                    (UIScreen.main.bounds.size.width/3)-20,
                    (UIScreen.main.bounds.size.width/3)-20,
                    (UIScreen.main.bounds.size.width/3)-20,
                    (UIScreen.main.bounds.size.width/2)-20,
                    (UIScreen.main.bounds.size.width/2)-20,
                    (UIScreen.main.bounds.size.width/3)-20,
                    (UIScreen.main.bounds.size.width/3)-20,
                    (UIScreen.main.bounds.size.width/3)-20]
        heightArr = [(UIScreen.main.bounds.size.width/2),
                     (UIScreen.main.bounds.size.width/2),
                     (UIScreen.main.bounds.size.width)-300,
                     (UIScreen.main.bounds.size.width)-200,
                     (UIScreen.main.bounds.size.width/3)-20,
                     (UIScreen.main.bounds.size.width/3)-20,
                     (UIScreen.main.bounds.size.width/3)-20,
                     (UIScreen.main.bounds.size.width/2),
                     (UIScreen.main.bounds.size.width/2),
                     (UIScreen.main.bounds.size.width)-350,
                     (UIScreen.main.bounds.size.width)-200,
                     (UIScreen.main.bounds.size.width)-200]
        
        self.productscollectionView.dataSource = self
        self.productscollectionView.delegate = self
        self.productscollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cellIdentifier")
    }
    override func viewWillAppear(_ animated: Bool) {
        image.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        image.contentMode = .scaleAspectFit
        image.image = UIImage(named: "homelogo")
        self.navigationItem.titleView = image
    }
}
extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return widthArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellIdentifier", for: indexPath)
        let imgBackGround = UIImageView(image: UIImage(named: "best-kids-clothing.jpg"))
        imgBackGround.layer.cornerRadius = 10
        if (imgBackGround.layer.cornerRadius > 0) {
            imgBackGround.layer.masksToBounds = true
        }
        cell.backgroundView = imgBackGround
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: widthArr[indexPath.row], height: widthArr[indexPath.row])
    }
}
