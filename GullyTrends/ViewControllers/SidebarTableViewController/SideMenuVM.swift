//
//  SideMenuVM.swift
//  GullyTrends
//
//  Created by karna on 05/01/20.
//  Copyright © 2020 GullyTrends. All rights reserved.
//

import Foundation

class SideMenuVM {
    
  static func getMenuData() -> [SideMenuModel] {
    let url = Bundle.main.url(forResource: "Menu", withExtension: "json")
    do {
      let jsonData = try Data(contentsOf: url!)
      let decoder = JSONDecoder()
      let jsonModel = try decoder.decode([SideMenuModel].self, from: jsonData)      
      return jsonModel
    }
    catch {
      print(error)
    }
    return [SideMenuModel]()
  }
  
  
  
  
  
}
