//
//  ProductDetailsVM.swift
//  GullyTrends
//
//  Created by karna on 11/01/20.
//  Copyright © 2020 GullyTrends. All rights reserved.
//

import UIKit

class ProductDetailsVM: UIViewController {
    @IBOutlet weak var similarProductsCollectionView: UICollectionView!
    @IBOutlet weak var recentlyViewedProductsCollectionView: UICollectionView!
    @IBOutlet weak var productImagesPageControl: UIPageControl!
    @IBOutlet weak var productImage: UIImageView!

    var productImageArray = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        productImageArray.append("temp-image")
        productImageArray.append("app-logo")
        productImageArray.append("book-tailor")
        productImageArray.append("ar-bg-icon")
        // Do any additional setup after loading the view.
        productImagesPageControl.numberOfPages = productImageArray.count
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func productImageRightSwipeGesture(_ sender: UISwipeGestureRecognizer) {
         // need to create common func
        if productImagesPageControl.currentPage > 0 {
            UIView.transition(with: productImage, duration: 1.0, options: .transitionFlipFromRight, animations: {
                self.productImagesPageControl.currentPage = (self.productImagesPageControl.currentPage) - 1
                let currentPage = self.productImagesPageControl.currentPage
                self.productImage.image = UIImage(named: self.productImageArray[currentPage])
            })
        } else {
            UIView.transition(with: productImage, duration: 1.0, options: .transitionFlipFromRight, animations: {
                self.productImagesPageControl.currentPage = self.productImageArray.count - 1
                let currentPage = self.productImagesPageControl.currentPage
                self.productImage.image = UIImage(named: self.productImageArray[currentPage])
            })
        }
    }
    @IBAction func productImageLeftSwipeGesture(_ sender: UISwipeGestureRecognizer) {
        // need to create common func
        if productImagesPageControl.currentPage < productImageArray.count - 1 {

            UIView.transition(with: productImage, duration: 1.0, options: .transitionFlipFromLeft, animations: {

                self.productImagesPageControl.currentPage = (self.productImagesPageControl.currentPage) + 1
                 let currentPage = self.productImagesPageControl.currentPage
                    self.productImage.image = UIImage(named: self.productImageArray[currentPage])
            })
        } else {
            UIView.transition(with: productImage, duration: 1.0, options: .transitionFlipFromLeft, animations: {
                self.productImagesPageControl.currentPage = 0
                 let currentPage = self.productImagesPageControl.currentPage
                    self.productImage.image = UIImage(named: self.productImageArray[currentPage])
            })
        }
    }


}
extension ProductDetailsVM: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.similarProductsCollectionView {
            return 10
        }else{
            return 2
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //need to create custom cell class
        if collectionView == self.similarProductsCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "similarProductsCell", for: indexPath)
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "recentlyViewedProductsCell", for: indexPath)
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (self.similarProductsCollectionView.layer.frame.size.width - 10)/4, height: self.similarProductsCollectionView.layer.frame.size.height)
    }
}
