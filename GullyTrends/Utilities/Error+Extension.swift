//
//  Error+Extension.swift
//  GullyTrends
//
//  Created by Muni on 06/01/20.
//  Copyright © 2020 GullyTrends. All rights reserved.
//

import Foundation


extension Error {
    var code: Int { return (self as NSError).code }
    var domain: String { return (self as NSError).domain }
    var message: String { return (self as NSError).userInfo["error"] as? String ?? "" }
}
