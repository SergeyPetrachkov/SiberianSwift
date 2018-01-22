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
  public func applyNavigationBarTheme(backgroundColor color: UIColor, shadowImage: UIImage? = nil, tintColor: UIColor = .white) {
    let backgroundImage = UIImage(color: color)
    self.navigationBar.setBackgroundImage(backgroundImage, for: .default)
    self.navigationBar.shadowImage = shadowImage
    self.navigationBar.tintColor = tintColor
  }
  public func pushViewController(_ viewController: UIViewController, animated: Bool, backText: String?) {
    self.topViewController?.navigationItem.backBarButtonItem = UIBarButtonItem(title: backText,
                                                                               style: .plain,
                                                                               target: nil,
                                                                               action: nil)
    self.pushViewController(viewController, animated: animated)
  }
}
