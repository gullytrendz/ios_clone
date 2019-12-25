//
//  ParseConstants.swift
//  GullyTrends
//
//  Created by Muni on 10/12/19.
//  Copyright © 2019 GullyTrends. All rights reserved.
//

import Foundation
import Parse

struct ParseKeys {
  static let ApplicationId = "a6c3d2f689462302580feac788adb3b6"
  static let ClientKey = "e053abd00a56a23494006180a9ba3c70"
  static let ServerKey = "http://gullytrendz.herokuapp.com/parse"
}

struct ParseClassName {
  static let K_SETTINGS = "Settings"
  static let K_PRODUCTS = "Products"
}


class ParseManger {
  
  //Initialise Parse SDK
  static func setup() {
    let parseConfig = ParseClientConfiguration {
      $0.applicationId = ParseKeys.ApplicationId
      $0.clientKey = ParseKeys.ClientKey
      $0.server = ParseKeys.ServerKey
    }
    Parse.initialize(with: parseConfig)
    
    saveAppInstallionInfo()
  }
  
  static func saveAppInstallionInfo() {
    let currentInstallation = PFInstallation.current()
    currentInstallation?.saveInBackground(block: { (succeeded, error) in
      if (error != nil) {
        print("You have successfully connected your app to Back4App!")
      } else {
        print("installation save failed %@",error.debugDescription)
      }
    })
  }
  
  static func queryWithClass(_ name: String, queries: [String: String]? = nil, _ completionHandler: @escaping (_ menuObjects: [PFObject]?, _ errorMsg: String?) -> Void) {
    let query = PFQuery(className: name)
    if let dict = queries {
      for (key, value) in dict {
        query.whereKey(key, equalTo: value)
      }
    }
    query.findObjectsInBackground { (arrayObjects, error) in
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
