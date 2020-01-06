//
//  SideMenuVM.swift
//  GullyTrends
//
//  Created by karna on 05/01/20.
//  Copyright © 2020 GullyTrends. All rights reserved.
//

import Foundation

class SideMenuVM {
    
    func getMenuData() -> [String: [MenuModel]] {
        var menuData = [String: [MenuModel]]()
        MenuVM.getSettingsLists { (settingsArray, errorMsg) in
            guard errorMsg == nil else {
                AlertUtilities.showAlert(message: errorMsg!) { _ in }
                return
            }
            
            //Filter menu type list from Settings
            MenuVM.getMenuList(array: settingsArray) { (menuArray) in
                print(menuArray)
                menuData = menuArray
            }
        }
        return menuData
    }

}
