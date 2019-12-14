//
//  LoginViewModel.swift
//  GullyTrends
//
//  Created by Muni on 10/12/19.
//  Copyright © 2019 Lakshmi Vajrapu. All rights reserved.
//

import UIKit

class ActivityIndicatorUitilities {
  
  var activityIndicatorView: UIActivityIndicatorView?
  static let sharedInstance: ActivityIndicatorUitilities = ActivityIndicatorUitilities()
  
  func showLoader() {
    DispatchQueue.main.async {
      if self.activityIndicatorView == nil {
        self.activityIndicatorView = UIActivityIndicatorView(style: .whiteLarge)
        self.activityIndicatorView?.color = UIColor.black
        self.activityIndicatorView?.hidesWhenStopped = true
        self.activityIndicatorView?.center =  appDelegate?.window?.rootViewController?.view.center ?? CGPoint.zero
        appDelegate?.window?.rootViewController?.view.addSubview(self.activityIndicatorView ?? UIActivityIndicatorView())
      }
      self.activityIndicatorView?.startAnimating()
      appDelegate?.window?.rootViewController?.view.isUserInteractionEnabled = false
    }
  }
  
  func hideLoader() {
    DispatchQueue.main.async {
      if self.activityIndicatorView != nil {
        self.activityIndicatorView?.stopAnimating()
      }
      appDelegate?.window?.rootViewController?.view.isUserInteractionEnabled = true
    }
  }
  
}
