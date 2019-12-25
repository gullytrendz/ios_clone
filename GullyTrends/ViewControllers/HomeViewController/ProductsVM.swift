//
//  ProductsVM.swift
//  GullyTrends
//
//  Created by Muni on 25/12/19.
//  Copyright © 2019 GullyTrends. All rights reserved.
//

import UIKit
import Parse

class ProductsVM {
  static func getProductLists(_ completionHandler: @escaping (_ menuObjects: [PFObject]?, _ errorMsg: String?) -> Void) {
    
    let object = PFObject(withoutDataWithClassName: ParseClassName.K_PRODUCTS, objectId: <#T##String?#>)
    ParseManger.queryWithClass(ParseClassName.K_PRODUCTS,
                               queries: ["category" : "KNWYLoj4Aa"]) { (array, errorMsg) in
                                completionHandler(array, errorMsg)
    }
  }
}
