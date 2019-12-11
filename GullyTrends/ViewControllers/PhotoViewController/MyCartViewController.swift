//
//  MyCartViewController.swift
//  tableViewDemo
//
//  Created by Siva kumar Mande on 06/12/19.
//  Copyright © 2019 sravan. All rights reserved.
//

import UIKit

class MyCartViewController: UIViewController {
    @IBOutlet weak var myCartDeliveryView: UIView!
    @IBOutlet weak var myCartDeliveryAddressLabel: UILabel!
    @IBOutlet weak var myCartSubTotalValueLabel: UILabel!
    @IBOutlet weak var myCartSubTotalPriceLabel: UILabel!
    @IBOutlet weak var myCartCollectionView: UICollectionView!
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
extension MyCartViewController:UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return 8;
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        let myOrdersCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCartCollectionViewCellIdentifier", for: indexPath)
        //hide the view existed at the bottom for last row

        return myOrdersCell
    }
}
