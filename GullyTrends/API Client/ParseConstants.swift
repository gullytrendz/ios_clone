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
  static let ApplicationId = "oK1ANsHVo1zKMZsfdeM2C0ixW8spsXw2JWBnP5nJ"
  static let ClientKey = "yRQD1tX8bbuEixkgYf0pFlQ7T59g4T1YzweFVRPU"
  static let ServerKey = "https://parseapi.back4app.com"
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
  
}
