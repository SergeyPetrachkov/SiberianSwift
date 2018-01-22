//
//  UIViewController+Siberia.swift
//  SiberianSwift
//
//  Created by Sergey Petrachkov on 22/01/2018.
//  Copyright © 2018 Sergey Petrachkov. All rights reserved.
//

import UIKit

extension UIViewController {
  func showToast(with message: String, width: CGFloat = 300, duration: Double = 4.0, delay: Double = 0.1) {
    let toastLabel = UILabel(frame: CGRect(x: (self.view.frame.size.width - width) / 2,
                                           y: self.view.frame.size.height / 2,
                                           width: width,
                                           height: 48))
    toastLabel.backgroundColor = UIColor.lightGray
    toastLabel.textColor = UIColor.black
    toastLabel.textAlignment = .center
    toastLabel.font = UIFont.systemFont(ofSize: 8)
    toastLabel.text = message
    toastLabel.alpha = 1.0
    toastLabel.layer.cornerRadius = 5
    toastLabel.clipsToBounds = true
    toastLabel.numberOfLines = 0
    let size = toastLabel.sizeThatFits(CGSize(width: width, height: self.view.bounds.height))
    
    toastLabel.frame.size = CGSize(width: max(size.width, width), height: max(48, size.height))
    toastLabel.center = self.view.center
    self.view.addSubview(toastLabel)
    UIView.animate(withDuration: duration,
                   delay: delay,
                   options: .curveEaseOut,
                   animations: {
      toastLabel.alpha = 0.9
    }, completion: { _ in
      toastLabel.removeFromSuperview()
    })
  }
}
