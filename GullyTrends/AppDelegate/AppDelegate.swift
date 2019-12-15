//
//  AppDelegate.swift
//  Dummy
//
//  Created by Muni on 14/12/19.
//  Copyright © 2019 Muni. All rights reserved.
//

import UIKit
import FacebookLogin
import FBSDKCoreKit
import GoogleSignIn
import Parse

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    // Override point for customization after application launch.
    
    //Parse Setup
    ParseManger.setup()
    
    //FB setup
    ApplicationDelegate.shared.application(application, didFinishLaunchingWithOptions: launchOptions)

    return true
  }

  func application(_ application: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey: Any]) -> Bool {
    //Facebok
    let sourceApplication =  options[UIApplication.OpenURLOptionsKey.sourceApplication] as? String
    let annotation = options[UIApplication.OpenURLOptionsKey.annotation]
    let facebookHandler = ApplicationDelegate.shared.application(application, open: url, sourceApplication: sourceApplication, annotation: annotation)

    //Google
    let googleHandler = GIDSignIn.sharedInstance()?.handle(url)
    
    return googleHandler! || facebookHandler
  }
  
  

}
