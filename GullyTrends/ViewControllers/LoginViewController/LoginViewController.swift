//
//  LoginViewController.swift
//  GullyTrends
//
//  Created by Muni on 10/12/19.
//  Copyright © 2019 Lakshmi Vajrapu. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

  @IBOutlet weak var userNameTF: UITextField!
  @IBOutlet weak var otpTF: UITextField!
  var loginVM: UserAuthentication!

  
    override func viewDidLoad() {
        super.viewDidLoad()
      loginVM = UserAuthentication()
        // Do any additional setup after loading the view.
    }
    
  @IBAction func tapOnSocailLogin(_ sender: UIButton) {
    loginVM.socialSignOn(type: SignOnMode(rawValue: sender.tag)!)
  }


}
