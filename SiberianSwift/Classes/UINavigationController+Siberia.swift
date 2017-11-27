//
//  UINavigationController+Siberia.swift
//  SiberianSwift
//
//  Created by Sergey Petrachkov on 27/11/2017.
//  Copyright © 2017 Sergey Petrachkov. All rights reserved.
//

import Foundation
import UIKit

public extension UINavigationController {
  public func applyTransparentNavigationBar() {
    self.navigationBar.setBackgroundImage(UIImage(), for: .default)
    self.navigationBar.shadowImage = UIImage()
    self.navigationBar.tintColor = UIColor.white
  }
  public func applyDefaultNavigationBar() {
    self.navigationBar.setBackgroundImage(nil, for: .default)
    self.navigationBar.shadowImage = nil
    self.navigationBar.layer.masksToBounds = false
    self.navigationBar.isTranslucent = true
    self.navigationBar.tintColor = UIColor.black
  }
}
