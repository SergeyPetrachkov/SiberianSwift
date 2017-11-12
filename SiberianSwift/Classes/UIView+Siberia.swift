//
//  UIView+Siberia.swift
//  SiberianSwift
//
//	Created by Sergey Petrachkov on 28/10/2017
//  Copyright © 2017 SiberianSwift. All rights reserved.
//

import Foundation
import UIKit

public extension UIView {
  // MARK: - Misc stuff
  
  /// Add blur effect to any view
	func addBlurEffect() {
    var blur: UIVisualEffectView?
    if #available(iOS 10.0, *) {
      blur = UIVisualEffectView(effect: UIBlurEffect(style: .regular))
    } else {
      blur = UIVisualEffectView(effect: UIBlurEffect(style: .light))
    }
    guard let blurView = blur else {
      return
    }
    blurView.frame = self.bounds
    blurView.isUserInteractionEnabled = false
    self.insertSubview(blurView, at: 0)
    self.sendSubview(toBack: blurView)
  }
	
	
  /// Move a view horizontally by given delta
	func moveHorizontally(by delta: CGFloat) {
    self.frame.origin.x += delta
	}
	
  /// Move a view to the left by given delta
	func moveLeft(by left : CGFloat) {
    self.moveHorizontally(by: -left)
	}
	
  /// Move a view to the right by given delta
	func moveRight(by delta: CGFloat) {
    self.moveHorizontally(by: delta)
	}
	
  /// Move a view to vertically by given delta
	func moveVertically(by delta : CGFloat) {
    self.frame.origin.y += delta
	}
	
  /// Move a view up by given delta
	func moveUp(by delta : CGFloat) {
    self.moveVertically(by: -delta)
	}
	
  /// Move a view down by given delta
	func moveDown(by delta : CGFloat) {
    self.moveVertically(by: delta)
	}
	
  /// Set top (origin.y) of the view to the given value
	func set(top : CGFloat) {
		self.frame = CGRect(x: self.frame.origin.x, y: top, width: self.frame.width, height: self.frame.height)
	}
	
  /// Place one view below another
	func placeDown(after view: UIView, delta: CGFloat) {
    self.set(top: view.frame.maxY + delta)
	}
	
  /// Place view to the rigt of another view
	func placeRight(after view: UIView, delta: CGFloat) {
    self.moveRight(by:view.frame.maxX + delta)
	}
	/// Change width of the view
	func set(width: CGFloat) {
    self.frame.size.width = width
	}
  
  /// Change height of the view
	func set(height: CGFloat) {
    self.frame.size.height = height
	}
  
  // MARK: - IBInspectable
  
	/// The color of the layer’s border. Animatable.
	@IBInspectable var borderColor : UIColor? {
		get {
			return UIColor.init(cgColor: self.layer.borderColor!)
		}
		set {
			self.layer.borderColor = newValue?.cgColor
		}
	}
	
	/// The width of the layer’s border. Animatable.
	@IBInspectable var borderWidth : CGFloat {
		get {
			return self.layer.borderWidth
		}
		set {
			self.layer.borderWidth = newValue
		}
	}
	
	/// The radius to use when drawing rounded corners for the layer’s background. Animatable.
	@IBInspectable var cornerRadius : CGFloat {
		get {
			return self.layer.cornerRadius
		}
		set {
			self.layer.cornerRadius = newValue
		}
	}
	
	/// A Boolean indicating whether sublayers are clipped to the layer’s bounds. Animatable.
	@IBInspectable var masksLayerToBounds : Bool {
		get {
			return self.layer.masksToBounds
		}
		set {
			self.layer.masksToBounds = newValue
		}
	}
	
	/// The color of the layer’s shadow. Animatable.
	@IBInspectable var shadowColor : UIColor? {
		get {
			return UIColor(cgColor: self.layer.shadowColor!)
		}
		set {
			self.layer.shadowColor = newValue!.cgColor
		}
	}
	
	/// The offset (in points) of the layer’s shadow. Animatable.
	@IBInspectable var shadowOffset : CGPoint {
		get {
			return CGPoint(x: self.layer.shadowOffset.width,
				y: self.layer.shadowOffset.height)
		}
		set {
			self.layer.shadowOffset = CGSize(width: newValue.x, height: newValue.y)
		}
	}
	
	/// The opacity of the layer’s shadow. Animatable.
	@IBInspectable var shadowOpacity : Float {
		get {
			return self.layer.shadowOpacity
		}
		set {
			self.layer.shadowOpacity = newValue
		}
	}
	
	/// The blur radius (in points) used to render the layer’s shadow. Animatable.
	@IBInspectable var shadowRadius : CGFloat {
		get {
			return self.layer.shadowRadius
		}
		set {
			self.layer.shadowRadius = newValue
		}
	}
	
	/// A Boolean that indicates whether the layer is rendered as a bitmap before compositing. Animatable.
	@IBInspectable var shouldRasterize: Bool {
		get {
			return self.layer.shouldRasterize
		}
		set {
			self.layer.shouldRasterize = newValue
		}
	}
	
	//MARK: - Constraints management

	func pinWithConstraint (_ viewToPinTo: UIView,
		attribute: NSLayoutAttribute,
		constant: CGFloat = 0.0,
		multiplier: CGFloat = 1.0,
		layoutRelation: NSLayoutRelation = NSLayoutRelation.equal,
		priority: UILayoutPriority = UILayoutPriority.required) -> NSLayoutConstraint? {
			
		var selfAttribute : NSLayoutAttribute
		selfAttribute = NSLayoutAttribute.notAnAttribute
		
		if (attribute == .left || attribute == .leftMargin) {
			selfAttribute = .left
		} else if (attribute == .top || attribute == .topMargin) {
			selfAttribute = .top
		} else if (attribute == .right || attribute == .rightMargin) {
			selfAttribute = .right
		} else if (attribute == .bottom || attribute == .bottomMargin) {
			selfAttribute = .bottom
		} else if (attribute == .centerX || attribute == .centerXWithinMargins) {
			selfAttribute = .centerX
		} else if (attribute == .centerY || attribute == .centerYWithinMargins) {
			selfAttribute = .centerY
		} else {
			return nil
		}
		
		let constraint = NSLayoutConstraint.init(item: self,
			attribute: selfAttribute,
			relatedBy: layoutRelation,
			toItem: viewToPinTo,
			attribute: attribute,
			multiplier: 1.0,
			constant: constant)
		constraint.priority = priority
		viewToPinTo.addConstraint(constraint)
		return constraint
	}
	
	func pinWithZeroInsets (_ viewToPinTo: UIView) -> [NSLayoutConstraint] {
		return pinWithInsets(viewToPinTo, insets: UIEdgeInsets())
	}
	
	func pinWithInsets (_ viewToPinTo: UIView, insets: UIEdgeInsets) -> [NSLayoutConstraint] {
		var constraints = [NSLayoutConstraint]()
		let leftConstraint = pinWithConstraint(viewToPinTo,
			attribute: NSLayoutAttribute.left,
			constant: insets.left)
		if (leftConstraint != nil) {
			constraints.append(leftConstraint!)
			viewToPinTo.addConstraint(leftConstraint!)
		}
		let topConstraint = pinWithConstraint(viewToPinTo,
			attribute: NSLayoutAttribute.top,
			constant: insets.top)
		if (topConstraint != nil) {
			constraints.append(topConstraint!)
			viewToPinTo.addConstraint(topConstraint!)
		}
		let rightConstraint = pinWithConstraint(viewToPinTo,
			attribute: NSLayoutAttribute.right,
			constant: insets.right)
		if (rightConstraint != nil) {
			constraints.append(rightConstraint!)
			viewToPinTo.addConstraint(rightConstraint!)
		}
		let bottomConstraint = pinWithConstraint(viewToPinTo,
			attribute: NSLayoutAttribute.bottom,
			constant: insets.bottom)
		if (bottomConstraint != nil) {
			constraints.append(bottomConstraint!)
			viewToPinTo.addConstraint(bottomConstraint!)
		}
		return constraints
	}
	
	func addCurrentHeightConstraint() -> NSLayoutConstraint? {
		return addHeightConstraint(self.bounds.height)
	}
	
	func addHeightConstraint(_ height: CGFloat) -> NSLayoutConstraint? {
		return NSLayoutConstraint(item: self,
			attribute: NSLayoutAttribute.height,
			relatedBy: NSLayoutRelation.equal,
			toItem: nil,
			attribute: NSLayoutAttribute.notAnAttribute,
			multiplier: 1.0,
			constant: height)
	}
	
	func addCurrentWidthConstraint() -> NSLayoutConstraint? {
		return addWidthConstraint(self.bounds.width)
	}
	
	func addWidthConstraint(_ width: CGFloat) -> NSLayoutConstraint? {
		return NSLayoutConstraint(item: self,
			attribute: NSLayoutAttribute.width,
			relatedBy: NSLayoutRelation.equal,
			toItem: nil,
			attribute: NSLayoutAttribute.notAnAttribute,
			multiplier: 1.0,
			constant: width)
	}
	
	func addCurrentSizeConstraints() -> [NSLayoutConstraint] {
		return addSizeConstraints(self.bounds.size)
	}
	
	func addSizeConstraints(_ size: CGSize) -> [NSLayoutConstraint] {
		var constraints = [NSLayoutConstraint]()
		let widthConstraint = addWidthConstraint(size.width)
		if (widthConstraint != nil) {
			constraints.append(widthConstraint!)
			self.addConstraint(widthConstraint!)
		}
		let heightConstraint = addHeightConstraint(size.height)
		if (heightConstraint != nil) {
			constraints.append(heightConstraint!)
			self.addConstraint(heightConstraint!)
		}
		return constraints
	}
	
	func addSizeConstraints(width: CGFloat, height: CGFloat) -> [NSLayoutConstraint] {
		return addSizeConstraints(CGSize(width: width, height: height))
	}
	
	func addAspectConstraint(_ x: CGFloat, y: CGFloat) -> NSLayoutConstraint {
		let constraint = NSLayoutConstraint(item: self,
			attribute: .width,
			relatedBy: .equal,
			toItem: self,
			attribute: .height,
			multiplier: x / y,
			constant: 0.0)
		self.addConstraint(constraint)
		return constraint
	}
	
	func addSpacingConstraint(_ otherView: UIView, spacingToAttribute: NSLayoutAttribute, constant: CGFloat = 0.0, multiplier: CGFloat = 1.0) -> NSLayoutConstraint? {
		var selfAttribute = NSLayoutAttribute.notAnAttribute
		
		if (spacingToAttribute == NSLayoutAttribute.left) {
			selfAttribute = NSLayoutAttribute.right
		} else if (spacingToAttribute == NSLayoutAttribute.top) {
			selfAttribute = NSLayoutAttribute.bottom
		} else if (spacingToAttribute == NSLayoutAttribute.right) {
			selfAttribute = NSLayoutAttribute.left
		} else if (spacingToAttribute == NSLayoutAttribute.bottom) {
			selfAttribute = NSLayoutAttribute.top
		} else {
			return nil
		}
		
		let constraint = NSLayoutConstraint(item: otherView,
			attribute: spacingToAttribute,
			relatedBy: NSLayoutRelation.equal,
			toItem: self,
			attribute: selfAttribute,
			multiplier: multiplier,
			constant: constant)
		otherView.superview!.addConstraint(constraint)
		return constraint
	}
  
  // MARK: - Rotation animations
  func startRotating(duration: Double = 1) {
    let kAnimationKey = "rotation"
    if self.layer.animation(forKey: kAnimationKey) == nil {
      let animate = CABasicAnimation(keyPath: "transform.rotation")
      animate.duration = duration
      animate.repeatCount = Float.infinity
      animate.fromValue = 0.0
      animate.toValue = Float(Double.pi * 2.0)
      self.layer.add(animate, forKey: kAnimationKey)
    }
  }
  func stopRotating() {
    let kAnimationKey = "rotation"
    if self.layer.animation(forKey: kAnimationKey) != nil {
      self.layer.removeAnimation(forKey: kAnimationKey)
    }
  }
}
