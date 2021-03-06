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
  static func getSettingsLists(_ settingsDataCompletionHandler: @escaping (_ settingsObjects: [PFObject]?, _ errorMsg: String?) -> Void) {
    
    //Keys
    let selectKeyArray = [Constants.objectId,
                          Constants.Settings.name,
                          Constants.Settings.type,
                          Constants.Settings.child]
    
    let includeKeyArray = [Constants.Settings.child]
    
    //Query Object
    var queriesObject = Queries()
    queriesObject.selectionKeys = [QueryTypes.SelectKeys: selectKeyArray,
                                   QueryTypes.IncludeKeys: includeKeyArray]
    
    //Calling request
    ParseManger.queryWithClass(Constants.ClassNames.K_SETTINGS,
                               queries: queriesObject) { (resultArray, errorMsg) in
                                DispatchQueue.main.async {
                                  settingsDataCompletionHandler(resultArray, errorMsg)
                                }                                
    }
    
  }
  
  static func getMenuList(array: [PFObject]?, _ menuCompletionHandler: @escaping (_ menuObjects: [SideMenuModel]) -> Void) {
    
    var menuData: [SideMenuModel] = SideMenuVM.getMenuData()
    
    //Filter results only menu types Eg: Men, Women, Kids
    let resultsArray = array?.filter({
      guard let type = ($0 as PFObject)[Constants.Settings.type] as? String else {
        return false
      }
      return type.lowercased() == Constants.Settings.menu
    })
    
    //Based on menu list fetching sub array data with proper names
    if let lists = resultsArray {
      for object in lists {
        var modelArray = [MenuModel]()
        if let childArray = object[Constants.Settings.child] as? [PFObject] {
          for menuObject in childArray {
            let model = MenuModel(objId: menuObject.objectId, name: menuObject[Constants.Settings.name] as? String)
            modelArray.append(model)
          }
        }
        if var typename = object[Constants.Settings.name] as? String {
          switch typename {
          case "Men":
            typename = "Men's"
          case "Women":
            typename = "Women's"
          default:
            break
          }
          
          if let row = menuData.firstIndex(where: {$0.name == typename}) {
            menuData[row].list = modelArray
          }
        }
      }
    }
    menuCompletionHandler(menuData)
  }
  
}
