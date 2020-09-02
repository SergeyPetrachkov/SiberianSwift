//
//  UIImage+Siberia.swift
//  SiberianSwift
//
//  Created by Sergey Petrachkov on 28/10/2017.
//  Copyright © 2017 SiberianSwift. All rights reserved.
//

#if !os(macOS)
import UIKit

public extension UIImage {
  /// Creates image of the specified size filled with the specified color.
  static func image(with color: UIColor, size: CGSize, scale: CGFloat = 1.0) -> UIImage? {
    let context = CGContext(data: nil,
                            width: Int(size.width * scale),
                            height: Int(size.height * scale),
                            bitsPerComponent: 8,
                            bytesPerRow: 0,
                            space: CGColorSpaceCreateDeviceRGB(),
                            bitmapInfo: CGImageAlphaInfo.premultipliedFirst.rawValue)!
    context.setFillColor(color.cgColor)
    context.fill(CGRect(x: 0, y: 0, width: size.width * scale, height: size.height * scale))
    
    if let imageRef = context.makeImage() {
      let image = UIImage(cgImage: imageRef)
      return image
    } else {
      return nil
    }
  }
  
  convenience init?(color: UIColor, size: CGSize = CGSize(width: 1, height: 1)) {
    let rect = CGRect(origin: .zero, size: size)
    UIGraphicsBeginImageContextWithOptions(rect.size, false, 0.0)
    color.setFill()
    UIRectFill(rect)
    let image = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    
    guard let cgImage = image?.cgImage else { return nil }
    self.init(cgImage: cgImage)
  }
}
#endif
