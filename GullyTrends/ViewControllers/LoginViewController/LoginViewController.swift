//
//  LoginViewController.swift
//  GullyTrends
//
//  Created by Muni on 10/12/19.
//  Copyright © 2019 GullyTrends. All rights reserved.
//

import UIKit

class LoginViewController: BaseViewController {
  
  // MARK: - Properties
  @IBOutlet weak var userNameTF: UITextField!
  @IBOutlet weak var otpTF: UITextField!
  var userAuthentication: UserAuthentication!
  var userNavType: USER_NAVIGATION = .None
  
  // MARK: - View Life Cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    
    //Hide nav bar
    isHiddenNavbar()
    
    //UserAuthentication
    userAuthentication = UserAuthentication()
    userAuthentication.authenticationCompletionHandler { (succeed, errorMsg) in
      DispatchQueue.main.async {
        guard succeed == false else {
          self.userNavType = .AugmentedReality
          self.navigateToPage()
          return
        }
        AlertUtilities.showAlert(message: errorMsg!) { _ in }
      }
    }
    
    //Validate Current user
    guard UserAuthentication.validateCurrentUser() == false else {
      self.userNavType = .Dashboard
      self.navigateToPage()
      return
    }
     
    //TODO: Below code use after login
    
    /*//Initial call request Settings pull the all records
     MenuVM.getSettingsLists { (settingsArray, errorMsg) in
     guard errorMsg == nil else {
     AlertUtilities.showAlert(message: errorMsg!) { _ in }
     return
     }
     
     /* ParseManger.shared.settingsArray = settingsArray
     
     
     let productId = "xrWQ3PXpuL"
     let product = ParseManger.shared.settingsArray?.filter({$0.objectId == productId}).first
     
     let sizeId = "e7hhCUgPKy"
     let sizeArray = ParseManger.shared.settingsArray?.filter({$0.objectId == sizeId})
     
     var productModel = ProductModel()
     productModel.category = product
     productModel.size = sizeArray
     
     ProductsVM.getProductLists(productModel) { _,_ in
     
     }*/
     
     
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
  
  private func navigateToPage() {
    LoginVM.fetchSettingsData { _ in
      DispatchQueue.main.async {

        switch self.userNavType {
        case .AugmentedReality:
          let aVC = AugmentedRealityVC.load(from: STORYBOARD.Main)
          self.navigationController?.pushViewController(aVC!, animated: true)
        case .Dashboard:
          let aVC = SWRevealViewController.load(from: STORYBOARD.Main)
          self.navigationController?.pushViewController(aVC!, animated: true)
        default:
          break
        }
      }
    }
  }
  
}
