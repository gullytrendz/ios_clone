//
//  SideMenuModel.swift
//  GullyTrends
//
//  Created by Muni on 06/01/20.
//  Copyright © 2020 GullyTrends. All rights reserved.
//

import UIKit

struct SideMenuModel : Codable {
  var name : String?
  var icon : String?
  var list: [MenuModel]?
  
  enum CodingKeys: String, CodingKey {
    case name = "name"
    case icon = "icon"
    case list = "list"
  }

}
