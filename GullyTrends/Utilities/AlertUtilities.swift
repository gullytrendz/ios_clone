//
//  AlertUtilities.swift
//  GullyTrends
//
//  Created by R.A. on 15/12/19.
//  Copyright © 2019 GullyTrends. All rights reserved.
//

import UIKit

class AlertUtilities {
  
  static let sharedInstance: AlertUtilities = AlertUtilities()
  
  // MARK: - AletView Controller
 static func showAlert(_ titleString: String = "", message messageString: String = "", buttons buttonsArray: [String] = ["OK"], completionHandler:@escaping (String) -> Void) {
    let alertController: UIAlertController = UIAlertController(title: titleString, message: messageString, preferredStyle: .alert)
    for index in 0..<buttonsArray.count {
      let alertAction: UIAlertAction = UIAlertAction(title: buttonsArray[index], style: .default ) { doneAction in
        completionHandler(doneAction.title ?? "")
      }
      alertController.addAction(alertAction)
    }
    appDelegate?.window?.rootViewController?.present(alertController, animated: true, completion: nil)
  }
  
}
