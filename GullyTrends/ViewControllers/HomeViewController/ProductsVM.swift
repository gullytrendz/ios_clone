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
  static func getProductLists(_ product: ProductModel, completionHandler: @escaping (_ menuObjects: [PFObject]?, _ errorMsg: String?) -> Void) {
        
    var stringkeys = [String: Any]()
    var containkeys = [String: [Any]]()

    if product.category != nil {
      stringkeys[Constants.Products.category] = product.category
    }
    
    if product.size != nil {
      containkeys[Constants.Products.size] = product.size
    }
    
    if product.vednorId != nil {
      stringkeys[Constants.Products.store] = product.vednorId
    }
    
    let selectKeyArray = [Constants.objectId,
    Constants.Products.discount,
    Constants.Products.price,
    Constants.Products.title,
    Constants.Products.images,
    Constants.Products.size,
    Constants.Products.category,
    Constants.Products.store]
    
    let includeKeyArray = [Constants.Products.size, Constants.Products.store]

    
    var queriesModel = Queries()
    queriesModel.dictionaryKeys = [QueryTypes.EqualTo: stringkeys,
                                   QueryTypes.ContainedIn: containkeys]
    
    queriesModel.selectionKeys = [QueryTypes.SelectKeys: selectKeyArray,
                                  QueryTypes.IncludeKeys: includeKeyArray]

    ParseManger.queryWithClass(Constants.ClassNames.K_PRODUCTS, queries: queriesModel) { (resultArray, errorMsg) in
                                DispatchQueue.main.async {
                                 // settingsDataCompletionHandler(resultArray, errorMsg)
                                  print(resultArray?.count)
                                  print(resultArray)
                                }
    }
    
    
    
  }
}
