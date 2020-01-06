//
//  LoginViewController.swift
//  GullyTrends
//
//  Created by Muni on 10/12/19.
//  Copyright © 2019 GullyTrends. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
  
  // MARK: - Properties
  @IBOutlet weak var userNameTF: UITextField!
  @IBOutlet weak var otpTF: UITextField!
  var userAuthentication: UserAuthentication!
  
  // MARK: - View Life Cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    
    //UserAuthentication
    userAuthentication = UserAuthentication()
    userAuthentication.authenticationCompletionHandler { (succeed, errorMsg) in
      DispatchQueue.main.async {
        if succeed! {
          self.navigateToAugmentedReality()
        } else {
          AlertUtilities.showAlert(message: errorMsg!) { _ in }
        }
      }
    }
    
    //Validate Current user
    if UserAuthentication.validateCurrentUser() {
      self.navigateToDashboard()
    }
     
    //TODO: Below code use after login
    
    /*//Initial call request Settings pull the all records
    MenuVM.getSettingsLists { (settingsArray, errorMsg) in
      guard errorMsg == nil else {
        AlertUtilities.showAlert(message: errorMsg!) { _ in }
        return
      }
      
      //Filter menu type list from Settings
      MenuVM.getMenuList(array: settingsArray) { (menuArray) in
        print(menuArray)
      }
    }*/
    
  }
  
  // MARK: - Actions
  @IBAction func tapOnSocailLogin(_ sender: UIButton) {
   userAuthentication.socialSignOn(type: SignOnMode(rawValue: sender.tag)!)

  }
  
  @IBAction func tapOnLogin(_ sender: UIButton) {
//    AlertUtilities.showAlert(message: "In progrss Login with OTP \n Try with Google/FB") { _ in }
    let mainVC = FilterViewController(nibName:"FilterViewController", bundle:nil)
    self.navigationController?.pushViewController(mainVC, animated: true);

  }
  
  private func navigateToAugmentedReality() {
    let aVC = AugmentedRealityVC.load(from: STORYBOARD.Main)
    self.navigationController?.pushViewController(aVC!, animated: true)
  }
  
  private func navigateToDashboard() {
    let aVC = MainView.load(from: STORYBOARD.Main)
    self.navigationController?.pushViewController(aVC!, animated: true)
  }
  
}
