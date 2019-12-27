//
//  FliterVM.swift
//  GullyTrends
//
//  Created by Muni on 27/12/19.
//  Copyright © 2019 GullyTrends. All rights reserved.
//

import Parse
import UIKit

class FliterVM {
  
  static func getFliterList(array: [PFObject]?, _ filterCompletionHandler: @escaping (_ fliterObjects: FliterModel) -> Void) {
    
    //Pattern
    let resultPatternArray = array?.filter({
      guard let type = ($0 as PFObject)[Constants.Settings.type] as? String else {
        return false
      }
      return type.lowercased() == Constants.Settings.pattern
    })
    
    //Sortings
    let resultSortingArray = array?.filter({
      guard let type = ($0 as PFObject)[Constants.Settings.type] as? String else {
        return false
      }
      return type.lowercased() == Constants.Settings.sorting
    })
    
    //Types
    let resultTypeArray = array?.filter({
      guard let type = ($0 as PFObject)[Constants.Settings.type] as? String else {
        return false
      }
      return type.lowercased() == Constants.Settings.type
    })
    
    //Sizes
    let resultSizeArray = array?.filter({
      guard let size = ($0 as PFObject)[Constants.Settings.type] as? String else {
        return false
      }
      return size.lowercased() == Constants.Settings.size
    })
    
    //Materials
    let resultMaterialArray = array?.filter({
      guard let material = ($0 as PFObject)[Constants.Settings.type] as? String else {
        return false
      }
      return material.lowercased() == Constants.Settings.material
    })
    
    //Brand
    let resultBrandArray = array?.filter({
      guard let brand = ($0 as PFObject)[Constants.Settings.type] as? String else {
        return false
      }
      return brand.lowercased() == Constants.Settings.brand
    })
    
    //Brand
    let resultColorArray = array?.filter({
      guard let color = ($0 as PFObject)[Constants.Settings.type] as? String else {
        return false
      }
      return color.lowercased() == Constants.Settings.color
    })
    
    var dict = [String: [PFObject]]()
    dict[Constants.Settings.type] = resultTypeArray
    dict[Constants.Settings.size] = resultSizeArray
    dict[Constants.Settings.material] = resultMaterialArray
    dict[Constants.Settings.color] = resultColorArray
    dict[Constants.Settings.brand] = resultBrandArray
    dict[Constants.Settings.pattern] = resultPatternArray
    dict[Constants.Settings.sorting] = resultSortingArray

    var model = FliterModel()
    model.dictionary = dict
    filterCompletionHandler(model)
  }
  
}
