//
//  LoginViewModel.swift
//  GullyTrends
//
//  Created by Muni on 10/12/19.
//  Copyright © 2019 Lakshmi Vajrapu. All rights reserved.
//

import UIKit
import Parse
import FacebookLogin
import GoogleSignIn

enum SignOnMode: Int {
  case FACEBOOK = 0
  case GOOGLE = 1
}

class UserAuthentication: NSObject {
  
  static let shared = UserAuthentication()
  
  func socialSignOn(type: SignOnMode) {
    switch type {
    case .GOOGLE:
      googleSignOn()
      break
    case .FACEBOOK:
      facebookSignOn()
      break
    }
  }
  
}

//MARK :- FACEBOOK Authentication
extension UserAuthentication {
  
  func facebookSignOn() {
    let loginManager = LoginManager()
    loginManager.logIn(
      permissions: [.publicProfile, .userFriends],
      viewController: rootViewController
    ) { result in
      self.loginManagerDidComplete(result)
    }
  }
  
  func loginManagerDidComplete(_ result: LoginResult) {
    switch result {
    case .cancelled:
      print("Login Cancelled")
    case .failed(let error):
      print("Login failed with error \(error)")
    case .success(let grantedPermissions, _, _):
      print("Login succeeded with granted permissions: \(grantedPermissions)")
    }
  }
  
}

//MARK :- Google Authentication

extension UserAuthentication: GIDSignInDelegate {
  
  func googleSignOn() {
    GIDSignIn.sharedInstance().clientID = "571839247263-ut27jh6e0mmp226lvc26taolpej2hc0k.apps.googleusercontent.com"
    GIDSignIn.sharedInstance().delegate = self
    GIDSignIn.sharedInstance()?.presentingViewController = rootViewController
    GIDSignIn.sharedInstance()?.signIn()
    
  }
  
  // MARK: - GIDSignInDelegate
  func sign(inWillDispatch signIn: GIDSignIn!, error: Error!) {
    //Hide loader
    ActivityIndicatorUitilities.sharedInstance.hideLoader()
  }
  
  // Present a view that prompts the user to sign in with Google
  func sign(_ signIn: GIDSignIn!, present viewController: UIViewController!) {
    UIApplication.shared.keyWindow?.rootViewController?.present(viewController, animated: true, completion: nil)
  }
  
  // Dismiss the "Sign in with Google" view
  func sign(_ signIn: GIDSignIn!, dismiss viewController: UIViewController!) {
    //Hide loader
    ActivityIndicatorUitilities.sharedInstance.hideLoader()
    UIApplication.shared.keyWindow?.rootViewController?.dismiss(animated: true, completion: nil)
  }
  
  func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
    if let error = error {
      print("\(error.localizedDescription)")
      //Hide loader
      ActivityIndicatorUitilities.sharedInstance.hideLoader()
    } else {
      DispatchQueue.main.async {
        GIDSignIn.sharedInstance().signOut()
      }
//      emailAddress = user.profile.email
//      accessToken = user.authentication.accessToken
//      authType = "GMAIL"
//      idToken = user.authentication.idToken
//      if let imageURL = user.profile.imageURL(withDimension: 200) {
//        profileImageUrl = imageURL.absoluteString
//      }      
    }
  }
  
  func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!, withError error: Error!) {
    //Hide loader
    ActivityIndicatorUitilities.sharedInstance.hideLoader()
  }
  
}
