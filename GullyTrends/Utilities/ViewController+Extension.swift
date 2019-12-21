//
//  ViewController+Extension.swift
//  GullyTrends
//
//  Created by R.A. on 15/12/19.
//  Copyright © 2019 GullyTrends. All rights reserved.
//

struct STORYBOARD {
  static let Main = "Main"
  static let Product = "product"
}

extension UIViewController {
  
  static func load<T: UIViewController>(from storyboardId: String? = nil) -> T?
  {
      if let storyboardName = storyboardId {
          let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
          return storyboard.instantiateViewController(withIdentifier: String(describing: self)) as? T
      } else {
          let view = Bundle.main.loadNibNamed(String(describing: self),
                                              owner: nil,
                                              options: nil)?.first
          return view as? T
      }
  }
  
}
