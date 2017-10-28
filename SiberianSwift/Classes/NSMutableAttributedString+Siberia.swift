//
//  NSMutableAttributedString+.swift
//  SiberianSwift
//
//  Created by sergey petrachkov on 10/01/2017.
//  Copyright © 2017 SiberianSwift. All rights reserved.
//

import Foundation
import UIKit

extension NSMutableAttributedString {
	convenience init(string: String,
	                 alignment: NSTextAlignment,
	                 font: UIFont?,
	                 lineBreakMode: NSLineBreakMode,
	                 lineSpacing: CGFloat = 0.0,
	                 foregroundColor: UIColor? = nil,
                   backgroundColor: UIColor? = nil) {
		let parStyle = NSMutableParagraphStyle()
		parStyle.alignment = alignment
		parStyle.lineBreakMode = lineBreakMode
		parStyle.lineSpacing = lineSpacing

		var attributes: [NSAttributedStringKey : Any] = [
      NSAttributedStringKey.baselineOffset: NSNumber(value: 0 as Int32),
      NSAttributedStringKey.paragraphStyle: parStyle
		]

		if let font = font {
      attributes[NSAttributedStringKey.font] = font
		}
		if let foregroundColor = foregroundColor {
      attributes[NSAttributedStringKey.foregroundColor] = foregroundColor
		}
    if let backgroundColor = backgroundColor {
      attributes[NSAttributedStringKey.backgroundColor] = backgroundColor
    }
		self.init(string: string, attributes: attributes)
	}
}
