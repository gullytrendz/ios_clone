//
//  SettingsVM.swift
//  GullyTrends
//
//  Created by Muni on 25/12/19.
//  Copyright © 2019 Lakshmi Vajrapu. All rights reserved.
//

import UIKit
import Parse

class MenuVM {
    
  //Side Menu List sub menus data
  static func getLists(_ completionHandler: @escaping (_ menuObjects: [PFObject]?, _ errorMsg: String?) -> Void) {
    
    
    ParseManger.queryWithClass(ParseClassName.K_SETTINGS,
                               queries: ["type" : "menu"]) { (array, errorMsg) in
                                completionHandler(array, errorMsg)
    }
  }

}
