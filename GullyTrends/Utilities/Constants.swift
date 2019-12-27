//
//  Constants.swift
//  GullyTrends
//
//  Created by Muni on 10/12/19.
//  Copyright © 2019 GullyTrends. All rights reserved.
//

import UIKit
import Parse

let rootVC = UIApplication.shared.windows.first!.rootViewController
let appDelegate = UIApplication.shared.delegate as? AppDelegate
var aUserInfo: PFUser? = PFUser()

struct Constants {

  //Global Keys
  static let objectId = "objectId"

  //Settings Keys
  struct Settings {
    static let name = "name"
    static let type = "type"
    static let child = "child"
    static let menu = "menu"
    //Filter
    static let size = "size"
    static let material = "material"
    static let brand = "brand"
    static let color = "color"
    static let sorting = "sorting"
    static let pattern = "pattern"

  }
  
  //Table Class Name Keys
  struct ClassNames {
    static let K_SETTINGS = "Settings"
    static let K_PRODUCTS = "Products"
  }
  
}
