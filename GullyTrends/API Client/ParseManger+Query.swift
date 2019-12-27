//
//  ParseManger+Query.swift
//  GullyTrends
//
//  Created by Muni on 27/12/19.
//  Copyright © 2019 GullyTrends. All rights reserved.
//

import Parse
import UIKit

enum QueryTypes: String {
  case EqualTo = "equalTo"
  case NotEqualTo = "notEqualTo"
  case LessThan = "lessThan"
  case LessThanOrEqualTo = "lessThanOrEqualTo"
  case GreaterThan = "greaterThan"
  case GreaterThanOrEqualTo = "greaterThanOrEqualTo"
  case MatchesText = "matchesText"
  case ContainedIn = "containedIn"
  case NotContainedIn = "notContainedIn"
  case ContainsAllObjectsInArray = "containsAllObjectsInArray"
  case IncludeKeys = "includeKeys"
  case SelectKeys = "selectKeys"
}

struct Queries {
  
  // skip the results records.
  var skip: Int?
  
  //By default, results are limited to 100.
  var limit: Int?
  
  //Eg: EqualTo, NotEqualTo ..etc
  var dictionaryKeys: [QueryTypes: [String: Any]]?
  
  //Eg: ContainedIn, NotContainedIn, ContainsAllObjectsInArray ..etc
  var arrayKeys: [QueryTypes: [String: [Any]]]?
  
  //Eg: SelectKeys, IncludeKeys ..etc
  var selectionKeys: [QueryTypes: [String]]?
  
}

extension ParseManger {
  
  static func getQueryKeys(_ type: Queries, query: PFQuery<PFObject>) -> PFQuery<PFObject> {
    
    if let limitCount =  type.limit {
      query.limit = limitCount
    }
    
    if let skipCount =  type.skip {
      query.skip = skipCount
    }
    
    //Query of String types
    if let dictionary = type.dictionaryKeys {
      for keyObject in Array(dictionary.keys) {
        let valueObject = dictionary[keyObject]
        switch keyObject {
        case .EqualTo:
          for (key, value) in (valueObject ?? nil)! {
            query.whereKey(key, equalTo: value)
          }
        case .GreaterThan:
          for (key, value) in (valueObject ?? nil)! {
            query.whereKey(key, greaterThan: value)
          }
        case .GreaterThanOrEqualTo:
          for (key, value) in (valueObject ?? nil)! {
            query.whereKey(key, greaterThanOrEqualTo: value)
          }
        case .LessThan:
          for (key, value) in (valueObject ?? nil)! {
            query.whereKey(key, lessThan: value)
          }
        case .LessThanOrEqualTo:
          for (key, value) in (valueObject ?? nil)! {
            query.whereKey(key, lessThanOrEqualTo: value)
          }
        case .MatchesText:
          for (key, value) in (valueObject ?? nil)! {
            query.whereKey(key, matchesText: value as! String)
          }
        case .NotEqualTo:
          for (key, value) in (valueObject ?? nil)! {
            query.whereKey(key, notEqualTo: value)
          }
        default:
          break
        }
        
      }
    }
    
    //Query of Array types
    if let dictionary = type.arrayKeys {
      for keyObject in Array(dictionary.keys) {
        let valueObject = dictionary[keyObject]
        switch keyObject {
        case .ContainedIn:
          for (key, value) in (valueObject ?? nil)! {
            query.whereKey(key, containedIn: value)
          }
        case .ContainsAllObjectsInArray:
          for (key, value) in (valueObject ?? nil)! {
            query.whereKey(key, containsAllObjectsIn: value)
          }
        case .NotContainedIn:
          for (key, value) in (valueObject ?? nil)! {
            query.whereKey(key, notContainedIn: value)
          }
        default:
          break
        }
      }
    }
    
    //Query of Selection types
    if let dictionary = type.selectionKeys {
      for keyObject in Array(dictionary.keys) {
        if let valueObject = dictionary[keyObject] {
          switch keyObject {
          case .IncludeKeys:
            query.includeKeys(valueObject)
          case .SelectKeys:
            query.selectKeys(valueObject)
          default:
            break
          }
        }
      }
    }
    
    //The network and then fall back to cached data if the network is not available
    query.cachePolicy = .cacheElseNetwork
    
    return query
  }
  
  static func queryWithClass(_ name: String, queries: Queries? = nil, _ completionHandler: @escaping (_ menuObjects: [PFObject]?, _ errorMsg: String?) -> Void) {
    
    var queryObject = PFQuery(className: name)
    
    if let object = queries {
      queryObject = getQueryKeys(object, query: queryObject)
    }
    
    queryObject.findObjectsInBackground { (arrayObjects, error) in
      if let error = error {
        completionHandler(nil, "The query failed \(error.localizedDescription)")
      } else if let objects = arrayObjects {
        // The query succeeded with a matching result
        print(objects.count)
        completionHandler(objects, nil)
      } else {
        completionHandler(nil, "The query succeeded but no matching result was found")
      }
    }
  }
  
}
