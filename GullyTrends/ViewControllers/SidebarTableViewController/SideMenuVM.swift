//
//  SideMenuVM.swift
//  GullyTrends
//
//  Created by karna on 05/01/20.
//  Copyright © 2020 GullyTrends. All rights reserved.
//

import Foundation

class SideMenuVM {
    
    
    func createData() -> [String: [String]] {
        var dataArray = [String: [String]]()
        dataArray["Men's"] = ["Shirts", "T-Shirts", "Jeans", "Kurta"]
        dataArray["Women's"] = ["Jeans", "Kurta"]
        dataArray["Kids"] = ["T Shirts", "Jeans"]
        dataArray["Designer Studios"] = ["Kurta"]
        dataArray["Home Shopping"] = []
        dataArray["Sell On Gully"] = []
        dataArray["Buy Wholesale"] = []
        dataArray["Customer Care"] = []
        dataArray["Buy Wholesale"] = []
        dataArray["Return Policy"] = []
        dataArray["FAQS"] = []
        dataArray["About & Policies"] = []
        return dataArray
    }

}
