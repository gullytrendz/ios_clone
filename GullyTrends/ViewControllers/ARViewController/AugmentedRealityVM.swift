//
//  AugmentedRealityVM.swift
//  GullyTrends
//
//  Created by R.A. on 15/12/19.
//  Copyright © 2019 GullyTrends. All rights reserved.
//

import UIKit

class AugmentedRealityVM {

  var controller: AugmentedRealityVC?

  init(vc: AugmentedRealityVC) {
    controller = vc
  }
  
  // MARK: - Methods
  func setupUI() {
    controller?.view.setGradientEffect()
  }
  
}
