//
//  UIView+Extension.swift
//  GullyTrends
//
//  Created by R.A. on 15/12/19.
//  Copyright © 2019 GullyTrends. All rights reserved.
//

import UIKit

extension UIView {
  
  func setGradientEffect(startPoint: CGPoint = CGPoint.zero, endPoint: CGPoint = CGPoint(x: 0.0, y: 1.0), startColor: UIColor? = UIColor(hex: "#501885"), endColor: UIColor? = UIColor(hex: "#0E1B60")) {
    let gradient = CAGradientLayer()
    gradient.frame = UIScreen.main.bounds
    gradient.startPoint = startPoint
    gradient.endPoint = endPoint
    gradient.colors = [startColor?.cgColor ?? UIColor.clear.cgColor, endColor?.cgColor ?? UIColor.clear.cgColor]
    self.layer.insertSublayer(gradient, at: 0)
  }
  
}
