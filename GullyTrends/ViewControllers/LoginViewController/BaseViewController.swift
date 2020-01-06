//
//  BaseViewController.swift
//  GullyTrends
//
//  Created by Muni on 06/01/20.
//  Copyright © 2020 GullyTrends. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
  
  func isHiddenNavbar() {
    self.navigationController?.setNavigationBarHidden(true, animated: false)
  }

}
