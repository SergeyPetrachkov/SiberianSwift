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
  
  func applyTransparentNavigationBar() {
    self.navigationBar.setBackgroundImage(UIImage(), for: .default)
    self.navigationBar.shadowImage = UIImage()
    self.navigationBar.tintColor = UIColor.white
  }
  
  func applyDefaultNavigationBar() {
    self.navigationBar.setBackgroundImage(nil, for: .default)
    self.navigationBar.shadowImage = nil
    self.navigationBar.layer.masksToBounds = false
    self.navigationBar.isTranslucent = true
    self.navigationBar.tintColor = UIColor.black
  }
  
  func applyNavigationBarTheme(backgroundColor color: UIColor, shadowImage: UIImage? = nil, tintColor: UIColor = .white) {
    let backgroundImage = UIImage(color: color)
    self.navigationBar.setBackgroundImage(backgroundImage, for: .default)
    self.navigationBar.shadowImage = shadowImage
    self.navigationBar.tintColor = tintColor
  }
  
  /// Decorate apple provided method by specifying text of a back button
  /// - parameters:
  ///   - viewController: The view controller to push onto the stack. This object cannot be a tab bar controller. If the view controller is already on the navigation stack, this method throws an exception.
  ///   - animated: Specify true to animate the transition or false if you do not want the transition to be animated. You might specify false if you are setting up the navigation controller at launch time.
  ///   - backText: Specify text you want to display for backBarButtonItem. It creates one with the given title and assigns to `topViewController?.navigationItem.backBarButtonItem`
  func pushViewController(_ viewController: UIViewController, animated: Bool, backText: String?) {
    self.topViewController?.navigationItem.backBarButtonItem = UIBarButtonItem(title: backText,
                                                                               style: .plain,
                                                                               target: nil,
                                                                               action: nil)
    self.pushViewController(viewController, animated: animated)
  }
}
