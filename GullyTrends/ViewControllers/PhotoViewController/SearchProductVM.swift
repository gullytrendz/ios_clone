//
//  SearchProductVC.swift
//  GullyTrends
//
//  Created by karna on 10/01/20.
//  Copyright © 2020 GullyTrends. All rights reserved.
//

import UIKit

class SearchProductVM: UIViewController {
    
    @IBOutlet weak var productCollectionView: UICollectionView!


    override func viewDidLoad() {
        super.viewDidLoad()
        // need to create navigation bar
        // Do any additional setup after loading the view.
    }
    @IBAction func backButtonClick(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }

}
extension SearchProductVM: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "productCell", for: indexPath) as! ProductCell
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (productCollectionView.layer.frame.size.width - 1)/2, height: productCollectionView.layer.frame.size.height/2)
    }
    
}
