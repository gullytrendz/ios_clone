//
//  MainViewController.swift
//  GullyTrends
//
//  Created by karna on 01/01/20.
//  Copyright © 2020 GullyTrends. All rights reserved.
//

import UIKit

class MainView: UIViewController {
    
    @IBOutlet weak var productscollectionView: UICollectionView!
    @IBOutlet weak var sidebarButton: UIBarButtonItem!
    
    var widthArr = [CGFloat]()
    var heightArr = [CGFloat]()
    lazy var image: UIImageView = {
        let img = UIImageView()
        img.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        img.contentMode = .scaleAspectFit
        img.image = UIImage(named: "homelogo")
        return img
    }()
    
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
        self.productscollectionView.register(MainViewCell.self, forCellWithReuseIdentifier: MainViewCell.reuseIdentifier)
        actionForSideMenu()
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationItem.titleView = image
    }
    func actionForSideMenu() {
        if self.revealViewController() != nil {
            sidebarButton.target = self.revealViewController()
            sidebarButton.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
    }
}
extension MainView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return widthArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainViewCell.reuseIdentifier, for: indexPath) as! MainViewCell
        cell.configure()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: widthArr[indexPath.row], height: widthArr[indexPath.row])
    }
}
