//
//  NSMutableAttributedString+.swift
//  SiberianSwift
//
//  Created by sergey petrachkov on 10/01/2017.
//  Copyright © 2017 SiberianSwift. All rights reserved.
//

import Foundation
import UIKit

public extension NSMutableAttributedString {
  /// Create mutable attributed string with specified parameters
  /// - parameters:
  ///   - string: desired text
  ///   - alignment: desired text alignment
  ///   - font: your font (optional)
  ///   - lineBreakMode: rule how to break lines
  ///   - lineSpacing: line spacing value, default -> 0
  ///   - foregroundColor: text color (optional)
  ///   - backgroundColor: text background (optional)
  ///
  ///
  ///       let sample = NSMutableAttributedString(string: "Hello from Siberia",
  ///                                             alignment: .left,
  ///                                             font: UIFont.systemFont(ofSize: 18, weight: UIFontWeightLight),
  ///                                             lineBreakMode: .byWordWrapping,
  ///                                             lineSpacing: 0,
  ///                                             foregroundColor: ColorMap.locatorTextColor,
  ///                                             backgroundColor: UIColor.clear)
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

    var attributes: [NSAttributedString.Key : Any] = [
      NSAttributedString.Key.baselineOffset: NSNumber(value: 0 as Int32),
      NSAttributedString.Key.paragraphStyle: parStyle
		]

		if let font = font {
      attributes[NSAttributedString.Key.font] = font
		}
		if let foregroundColor = foregroundColor {
      attributes[NSAttributedString.Key.foregroundColor] = foregroundColor
		}
    if let backgroundColor = backgroundColor {
      attributes[NSAttributedString.Key.backgroundColor] = backgroundColor
    }
		self.init(string: string, attributes: attributes)
	}
  
  public func height(withConstrainedWidth width: CGFloat) -> CGFloat {
    let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
    let boundingBox = boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, context: nil)
    return ceil(boundingBox.height)
  }
  
  public func width(withConstrainedHeight height: CGFloat) -> CGFloat {
    let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
    let boundingBox = boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, context: nil)
    return ceil(boundingBox.width)
  }
}
