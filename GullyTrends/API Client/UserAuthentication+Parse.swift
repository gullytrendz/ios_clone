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
                              guard user == nil else {
                                // Do stuff after successful login.
                                self.completionHandler(true, nil)
                                return
                              }
                              guard error?.message == nil else {
                                // Show the errorString somewhere and let the user try again.
                                self.completionHandler(false, error?.message)
                                return
                              }
                              // The login failed. Check error to see why.
                              self.userRegistration()
    }
  }
  
  //Registration
  func userRegistration() {
    aUserInfo = PFUser()
    aUserInfo?.username = userModel.userName
    aUserInfo?.email = userModel.email
    aUserInfo?.password = userModel.password
    aUserInfo?.signUpInBackground { (succeeded, error) in
      guard error?.message == nil else {
        // Show the errorString somewhere and let the user try again.
        self.completionHandler(false, error?.message)
        return
      }
      // Hooray! Let them use the app now.
      self.completionHandler(true, nil)
    }
  }
  
  static func validateCurrentUser() -> Bool {
    let currentUser = PFUser.current()
    guard currentUser != nil else {
      return false
    }
    aUserInfo = currentUser
    //    let predicate = NSPredicate(format: "type = menu")
    //    let query = PFQuery(className: ParseClassName.K_SETTINGS, predicate: predicate)
    
    return true
  }
  
}
