//
//  ParseConstants.swift
//  GullyTrends
//
//  Created by Muni on 10/12/19.
//  Copyright © 2019 Lakshmi Vajrapu. All rights reserved.
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
  func setup() {
    let parseConfig = ParseClientConfiguration {
      $0.applicationId = ParseKeys.ApplicationId
      $0.clientKey = ParseKeys.ClientKey
      $0.server = ParseKeys.ServerKey
    }
    Parse.initialize(with: parseConfig)
  }
  
}
