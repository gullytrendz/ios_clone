//
//  AugmentedRealityVC.swift
//  GullyTrends
//
//  Created by R.A. on 15/12/19.
//  Copyright © 2019 GullyTrends. All rights reserved.
//

import UIKit

class AugmentedRealityVC: UIViewController {
  
  // MARK: - Properties
  @IBOutlet weak var checkButton: UIButton!
  var aVM: AugmentedRealityVM!
  
  // MARK: - View Life Cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    aVM = AugmentedRealityVM(vc: self)
    aVM.setupUI()
  }
  
  // MARK: - Actions
  @IBAction func tapOnTermsAndConditions() {
    checkButton.isSelected.toggle()
  }
  
  @IBAction func tapOnSizes() {
     checkButton.isSelected.toggle()
   }
  
  @IBAction func tapOnSkip() {
    checkButton.isSelected.toggle()
  }
  
}
