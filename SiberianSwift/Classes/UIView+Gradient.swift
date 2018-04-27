//
//  UIView+Gradient.swift
//  SiberianSwift
//
//  Created by Sergey Petrachkov on 27/04/2018.
//  Copyright © 2018 Sergey Petrachkov. All rights reserved.
//

import Foundation
import UIKit
public typealias GradientPoints = (startPoint: CGPoint, endPoint: CGPoint)

public enum GradientOrientation {
  case topRightBottomLeft
  case topLeftBottomRight
  case horizontal
  case vertical
  
  var startPoint: CGPoint {
    return points.startPoint
  }
  
  var endPoint: CGPoint {
    return points.endPoint
  }
  
  var points: GradientPoints {
    switch self {
    case .topRightBottomLeft:
      return (CGPoint.init(x: 0.0, y: 1.0), CGPoint.init(x: 1.0, y: 0.0))
    case .topLeftBottomRight:
      return (CGPoint.init(x: 0.0, y: 0.0), CGPoint.init(x: 1, y: 1))
    case .horizontal:
      return (CGPoint.init(x: 0.0, y: 0.5), CGPoint.init(x: 1.0, y: 0.5))
    case .vertical:
      return (CGPoint.init(x: 0.0, y: 0.0), CGPoint.init(x: 0.0, y: 1.0))
    }
  }
}
public extension UIView {
  func applyGradient(colors: [UIColor]) -> Void {
    self.applyGradient(colors: colors, locations: nil)
  }
  
  func applyGradient(colors: [UIColor], locations: [NSNumber]?) -> Void {
    let gradient: CAGradientLayer = CAGradientLayer()
    gradient.frame = self.bounds
    gradient.colors = colors.map { $0.cgColor }
    gradient.locations = locations
    self.layer.insertSublayer(gradient, at: 0)
  }
  func applyGradient(colors: [UIColor], gradientOrientation: GradientOrientation) {
    let gradient: CAGradientLayer = CAGradientLayer()
    gradient.frame = self.bounds
    gradient.colors = colors.map { $0.cgColor }
    gradient.startPoint = gradientOrientation.startPoint
    gradient.endPoint = gradientOrientation.endPoint
    self.layer.insertSublayer(gradient, at: 0)
  }
}
