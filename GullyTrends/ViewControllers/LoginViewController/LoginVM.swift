//
//  LoginVM.swift
//  GullyTrends
//
//  Created by R.A. on 15/12/19.
//  Copyright © 2019 GullyTrends. All rights reserved.
//

import UIKit
import Parse

enum USER_NAVIGATION: Int {
  case None = -1
  case AugmentedReality = 0
  case Dashboard = 1
}

class LoginVM {

  static func fetchSettingsData(completionHander: @escaping(_ status: Bool) -> Void) {
    MenuVM.getSettingsLists { (settingsArray, errorMsg) in
      guard errorMsg == nil else {
        //AlertUtilities.showAlert(message: errorMsg!) { _ in }
        print(errorMsg!)
        completionHander(false)
        return
      }
      ParseManger.shared.settingsArray = settingsArray
      completionHander(true)
    }
  }
  
}
