//
//  UIColor+.swift
//  SiberianSwift
//
//  Created by Sergey Petrachkov on 28/10/2017.
//  Copyright © 2016 SiberianSwift. All rights reserved.
//

import UIKit

extension UIColor {
	convenience init(rgbaColorCode:Int) {
		let r = ((CGFloat)((rgbaColorCode & 0xff0000) >> 24)) / 255.0;
		let g = ((CGFloat)((rgbaColorCode & 0xff0000) >> 16)) / 255.0;
		let b = ((CGFloat)((rgbaColorCode & 0xff00) >> 8)) / 255.0;
		let a = ((CGFloat)(rgbaColorCode & 0xff)) / 255.0;
		self.init(red: r, green: g, blue: b, alpha: a);
	}

	convenience init(rgbColorCode:Int) {
		let r = ((CGFloat)((rgbColorCode & 0xff0000) >> 16)) / 255.0;
		let g = ((CGFloat)((rgbColorCode & 0xff00) >> 8)) / 255.0;
		let b = ((CGFloat)(rgbColorCode & 0xff)) / 255.0;
		self.init(red: r, green: g, blue: b, alpha: 1);
	}
}
