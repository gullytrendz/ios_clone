//
//  LoginViewModel.swift
//  GullyTrends
//
//  Created by Muni on 10/12/19.
//  Copyright © 2019 GullyTrends. All rights reserved.
//

import UIKit
import FacebookLogin
import FBSDKCoreKit
import GoogleSignIn
import Parse
import MBProgressHUD

enum SignOnMode: Int {
  case FACEBOOK = 0
  case GOOGLE = 1
}

class UserAuthentication: NSObject {
  
  // MARK: - Properties
  var completionHandler: (_ status: Bool?, _ errorMsg: String?) -> Void = { _, _ in }
  var userModel = UserModel()
  static let shared = UserAuthentication()
  
  // MARK: - Methods
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
  
  //Call back block
  func authenticationCompletionHandler(_ handler: @escaping (_ status: Bool?, _ errorMsg: String?) -> Void) {
    completionHandler = handler
  }
  
}

//MARK :- FACEBOOK Authentication
extension UserAuthentication {
  
  func facebookSignOn() {
    //Loader
    MBProgressHUD.showAdded(to: (rootVC?.view)!, animated: true)
    
    let loginManager = LoginManager()
    loginManager.logIn(
      permissions: [.publicProfile, .email],
      viewController: UIApplication.shared.windows.first!.rootViewController
    ) { result in
      self.loginManagerDidComplete(result)
    }
  }
  
  func loginManagerDidComplete(_ result: LoginResult) {
    switch result {
    case .cancelled, .failed:
      print("Login Cancelled")
      DispatchQueue.main.async {
        //Hide loader
        MBProgressHUD.hide(for: (rootVC?.view)!, animated: true)
      }
    case .success(let grantedPermissions, _, _):
      print("Login succeeded with granted permissions: \(grantedPermissions)")
      getFacebookUserData()
    }
  }
  
  //User FB profile details
  func getFacebookUserData() {
    if AccessToken.current != nil {
      let graphRequest: GraphRequest = GraphRequest(graphPath: "me", parameters: ["fields": "name,email,picture.type(large)"])
      graphRequest.start { (_, result, error) -> Void in
        
        DispatchQueue.main.async {
          //Hide loader
          MBProgressHUD.hide(for: (rootVC?.view)!, animated: true)
        }
        if error != nil {
          print("Error: \(error.debugDescription)")
        } else {
          if let data = result as? [String: AnyObject] {
            print(data)
            self.userModel.email = data["email"] as? String
            // TODO: At present set dummy pwd. Will change later
            self.userModel.password = data["id"] as? String
            self.userModel.userName = data["id"] as? String
            //self.accessToken  = FBSDKAccessToken.current().tokenString
            //self.authType     = "FACEBOOK"
            //            if let imageURL = ((data["picture"] as? [String: Any])?["data"] as? [String: Any])?["url"] as? String {
            //              self.profileImageUrl = imageURL
            //            }
            LoginManager().logOut()
            //User account validation
            self.validateUserdata()
          }
        }
        
      }
    }
  }
  
}

//MARK :- Google Authentication
extension UserAuthentication: GIDSignInDelegate {
  
  func googleSignOn() {
    //Loader
    MBProgressHUD.showAdded(to: (rootVC?.view)!, animated: true)
    
    GIDSignIn.sharedInstance().clientID = "571839247263-ut27jh6e0mmp226lvc26taolpej2hc0k.apps.googleusercontent.com"
    GIDSignIn.sharedInstance().delegate = self
    GIDSignIn.sharedInstance()?.presentingViewController = UIApplication.shared.windows.first!.rootViewController
    GIDSignIn.sharedInstance()?.signIn()
    
  }
  
  // MARK: - GIDSignInDelegate
  func sign(inWillDispatch signIn: GIDSignIn!, error: Error!) {
    //Hide loader
    MBProgressHUD.hide(for: (rootVC?.view)!, animated: true)
  }
  
  // Present a view that prompts the user to sign in with Google
  func sign(_ signIn: GIDSignIn!, present viewController: UIViewController!) {
    UIApplication.shared.keyWindow?.rootViewController?.present(viewController, animated: true, completion: nil)
  }
  
  // Dismiss the "Sign in with Google" view
  func sign(_ signIn: GIDSignIn!, dismiss viewController: UIViewController!) {
    //Hide loader
    MBProgressHUD.hide(for: (rootVC?.view)!, animated: true)
    UIApplication.shared.keyWindow?.rootViewController?.dismiss(animated: true, completion: nil)
  }
  
  func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
    if let error = error {
      print("\(error.localizedDescription)")
      //Hide loader
      MBProgressHUD.hide(for: (rootVC?.view)!, animated: true)
    } else {
      DispatchQueue.main.async {
        MBProgressHUD.hide(for: (rootVC?.view)!, animated: true)
        GIDSignIn.sharedInstance().signOut()
      }
      userModel.email = user?.profile?.email
      // TODO: At present set dummy pwd. Will change later
      userModel.password = user?.userID
      userModel.userName = user?.userID
      //User account validation
      validateUserdata()
    }
  }
  
  func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!, withError error: Error!) {
    //Hide loader
    MBProgressHUD.hide(for: (rootVC?.view)!, animated: true)
  }
  
}
