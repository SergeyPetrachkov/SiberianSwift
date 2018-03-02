//
//  UIColor+Siberia.swift
//  SiberianSwift
//
//  Created by Sergey Petrachkov on 28/10/2017.
//  Copyright © 2016 SiberianSwift. All rights reserved.
//

import UIKit

public extension UIColor {
  /// Create UIColor object from int code with desired alpha level.
	convenience init(rgbaColorCode: Int) {
		let r = ((CGFloat)((rgbaColorCode & 0xff0000) >> 24)) / 255.0;
		let g = ((CGFloat)((rgbaColorCode & 0xff0000) >> 16)) / 255.0;
		let b = ((CGFloat)((rgbaColorCode & 0xff00) >> 8)) / 255.0;
		let a = ((CGFloat)(rgbaColorCode & 0xff)) / 255.0;
		self.init(red: r, green: g, blue: b, alpha: a);
	}
  /// Create UIColor object from int code. Alpha = 1.0
	convenience init(rgbColorCode: Int) {
		let r = ((CGFloat)((rgbColorCode & 0xff0000) >> 16)) / 255.0;
		let g = ((CGFloat)((rgbColorCode & 0xff00) >> 8)) / 255.0;
		let b = ((CGFloat)(rgbColorCode & 0xff)) / 255.0;
		self.init(red: r, green: g, blue: b, alpha: 1);
	}
  
  /// Returns random generated color.
  public static var random: UIColor {
    srandom(arc4random())
    var red: Double = 0
    
    while (red < 0.1 || red > 0.84) {
      red = drand48()
    }
    
    var green: Double = 0
    while (green < 0.1 || green > 0.84) {
      green = drand48()
    }
    
    var blue: Double = 0
    while (blue < 0.1 || blue > 0.84) {
      blue = drand48()
    }
    
    return .init(red: CGFloat(red), green: CGFloat(green), blue: CGFloat(blue), alpha: 1.0)
  }
}
