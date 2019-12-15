//
//  UserAuthentication+Parse.swift
//  GullyTrends
//
//  Created by R.A. on 15/12/19.
//  Copyright © 2019 GullyTrends. All rights reserved.
//

import UIKit
import Parse

extension UserAuthentication {
  
  //Logged user validation
  func validateUserdata() {
    PFUser.logInWithUsername(inBackground: userModel.userName!,
                             password: userModel.password!) { (user, error) in
                              if user != nil {
                                // Do stuff after successful login.
                                self.completionHandler(true, nil)
                              } else {
                                // The login failed. Check error to see why.
                                self.userRegistration()
                              }
    }
  }
  
  //Registration
  func userRegistration() {
    aUserInfo = PFUser()
    aUserInfo?.username = userModel.userName
    aUserInfo?.email = userModel.email
    aUserInfo?.password = userModel.password
    aUserInfo?.signUpInBackground { (succeeded, error) in
      if let error = error {
        let errorString = (error as NSError).userInfo["error"] as? String
        // Show the errorString somewhere and let the user try again.
        self.completionHandler(false, errorString)
      } else {
        // Hooray! Let them use the app now.
        self.completionHandler(true, nil)
      }
    }
  }
  
  static func validateCurrentUser() -> Bool {
    let currentUser = PFUser.current()
    guard currentUser != nil else {
      return false
    }
    aUserInfo = currentUser
    return true
  }
  
}
