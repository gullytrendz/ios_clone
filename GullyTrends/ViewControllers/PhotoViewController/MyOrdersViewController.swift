//
//  MyOrdersViewController.swift
//  tableViewDemo
//
//  Created by Siva kumar Mande on 06/12/19.
//  Copyright © 2019 sravan. All rights reserved.
//

import UIKit

class MyOrdersViewController: UIViewController {
    @IBOutlet weak var myOrdersDeliveryView: UIView!
     @IBOutlet weak var myOrdersDeliveryAddressLabel: UILabel!
     @IBOutlet weak var myOrdersSubTotalValueLabel: UILabel!
     @IBOutlet weak var myOrdersSubTotalPriceLabel: UILabel!
     @IBOutlet weak var myOrdersCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension MyOrdersViewController:UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return 8;
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        let myOrdersCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyOrdersCollectionViewCellIdentifier", for: indexPath)
        //hide the view existed at the bottom for last row

        return myOrdersCell
    }
   //    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    //        let collectionViewWidth = self.view.frame.size.width - 50
    //        let collectionViewHeight = self.view.frame.size.height - 160
    //
    //           return CGSize(width: collectionViewHeight, height: collectionViewWidth/4)//height 160 will be ideal
    //       }
//       func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
//        {
//           return CGSize(width: 100.0, height: 100.0)
//        }

}
