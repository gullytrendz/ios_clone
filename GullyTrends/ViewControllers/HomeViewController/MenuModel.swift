//
//  MenuModel.swift
//  GullyTrends
//
//  Created by Muni on 26/12/19.
//  Copyright © 2019 GullyTrends. All rights reserved.
//

import UIKit

struct MenuModel: Codable {
  var objId: String?
  var name: String?
  
  enum CodingKeys: String, CodingKey {
    case objId = "objId"
    case name = "name"
  }
}
