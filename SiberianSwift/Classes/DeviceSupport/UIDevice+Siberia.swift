//
//  UIDevice+Siberia.swift
//  SiberianSwift
//
//  Created by SergeyPetrachkov on 28/10/2017
//  Copyright © 2017 SiberianSwift. All rights reserved.
//

import Foundation
import UIKit

public extension UIDevice {
  /// Boolean that states that the current device is iPhone
  var iPhone: Bool {
    return UIDevice().userInterfaceIdiom == .phone
  }
  /// Boolean that states that the current device is iPad
  var iPad: Bool {
    return UIDevice().userInterfaceIdiom == .pad
  }
  /// Boolean that states that the current device is AppleTV
  var appleTV: Bool {
    return UIDevice().userInterfaceIdiom == .tv
  }
  
  enum ScreenType: String {
    /// iPhone 4 and 4s screen
    case iPhone4
    /// iPhone 5, 5C, 5S, SE screen
    case iPhone5
    /// iPhone 6, 6S, 7, 8 screen size
    case iPhone4_7Inch
    /// iPhone 6, 6S, 7, 8 screen size (zoomed mode)
    case iPhone4_7InchZoomed
    /// iPhone 6,7,8 Plus  screen size
    case iPhonePlus
    /// iPhone 6,7,8 Plus screen size (zoomed mode)
    case iPhonePlusZoomed
    /// iPhone X XS
    case iPhone5_8
    case iPhone6_5Inch
    case iPhone6_1Inch
    /// iPadMini
    case iPadMini
    /// iPad9.7 inch
    case iPad9_7
    /// iPad 10.5 inch
    case iPad10_5
    /// iPad 12.9 inch
    case iPad12_9
    /// Unrecognized screen size
    case unrecognized
  }
  
  /// Device screen type
  var screenType: ScreenType {
    let width: Double = Double(UIScreen.main.bounds.width)
    let height: Double = Double(UIScreen.main.bounds.height)
    let screenHeight: Double = max(width, height)
    
    switch screenHeight {
    case 480:
      return .iPhone4
    case 568:
      return .iPhone5
    case 667:
      return UIScreen.main.scale == 3.0 ? .iPhonePlusZoomed : .iPhone4_7Inch
    case 736:
      return .iPhonePlus
    case 812:
      return .iPhone5_8
    case 896:
      return UIScreen.main.scale == 3.0 ? .iPhone6_5Inch : .iPhone6_1Inch
      
    case 1024:
      switch modelName {
      case .iPadMini,.iPadMini2,.iPadMini3,.iPadMini4:
        return .iPadMini
      case .iPadPro10_5Inch:
        return .iPad10_5
      default:
        return .iPad9_7
      }
    case 1112:
      return .iPad10_5
    case 1366:
      return .iPad12_9
    
    default:
      return .unrecognized
    }
  }
  
  var isSmallScreen : Bool {
    return screenType == .iPhone4 || screenType == .iPhone5 || screenType == .iPhonePlusZoomed
  }
  
  func SYSTEM_VERSION_EQUAL_TO(_ version: String) -> Bool {
    return UIDevice.current.systemVersion.compare(version,
                                                  options: NSString.CompareOptions.numeric) == ComparisonResult.orderedSame
  }
  
  func SYSTEM_VERSION_GREATER_THAN(_ version: String) -> Bool {
    return UIDevice.current.systemVersion.compare(version,
                                                  options: NSString.CompareOptions.numeric) == ComparisonResult.orderedDescending
  }
  
  func SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(_ version: String) -> Bool {
    return UIDevice.current.systemVersion.compare(version,
                                                  options: NSString.CompareOptions.numeric) != ComparisonResult.orderedAscending
  }
  
  func SYSTEM_VERSION_LESS_THAN(_ version: String) -> Bool {
    return UIDevice.current.systemVersion.compare(version,
                                                  options: NSString.CompareOptions.numeric) == ComparisonResult.orderedAscending
  }
  
  func SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(_ version: String) -> Bool {
    return UIDevice.current.systemVersion.compare(version,
                                                  options: NSString.CompareOptions.numeric) != ComparisonResult.orderedDescending
  }
  
  /// User-friendly device name like in Store
  var modelName: DeviceModel {
    var systemInfo = utsname()
    uname(&systemInfo)
    let machineMirror = Mirror(reflecting: systemInfo.machine)
    let identifier = machineMirror.children.reduce("") { identifier, element in
      guard let value = element.value as? Int8 , value != 0 else { return identifier }
      return identifier + String(UnicodeScalar(UInt8(value)))
    }
    switch identifier {
      
    case "iPhone3,1", "iPhone3,2", "iPhone3,3":
      return .iPhone4
    case "iPhone4,1":
      return .iPhone4S
    case "iPhone5,1", "iPhone5,2":
      return .iPhone5
    case "iPhone5,3", "iPhone5,4":
      return .iPhone5C
    case "iPhone6,1", "iPhone6,2":
      return .iPhone5S
    case "iPhone7,2":
      return .iPhone6
    case "iPhone7,1":
      return .iPhone6Plus
    case "iPhone8,1":
      return .iPhone6S
    case "iPhone8,2":
      return .iPhone6SPlus
    case "iPhone9,1", "iPhone9,3":
      return .iPhone7
    case "iPhone9,2", "iPhone9,4":
      return .iPhone7Plus
    case "iPhone8,4":
      return .iPhoneSE
    case "iPhone10,1", "iPhone10,4":
      return .iPhone8
    case "iPhone10,2", "iPhone10,5":
      return .iPhone8Plus
    case "iPhone10,3", "iPhone10,6":
      return .iPhoneX
    case "iPhone11,2":
      return .iPhoneXS
    case "iPhone11,4", "iPhone11,6":
      return .iPhoneXSMax
    case "iPhone11,8":
      return .iPhoneXR
    case "iPhone12,1":
      return .iPhone11
    case "iPhone12,3":
      return .iPhone11Pro
    case "iPhone12,5":
      return .iPhone11ProMax

    case "iPad1,1":
      return .iPad1
    case "iPad2,1", "iPad2,2", "iPad2,3", "iPad2,4":
      return .iPad2
    case "iPad3,1", "iPad3,2", "iPad3,3":
      return .iPad3
    case "iPad3,4", "iPad3,5", "iPad3,6":
      return .iPad4
    case "iPad6,11", "iPad6,12":
      return .iPad5
    case "iPad4,1", "iPad4,2", "iPad4,3":
      return .iPadAir
    case "iPad5,3", "iPad5,4":
      return .iPadAir2
    case "iPad2,5", "iPad2,6", "iPad2,7":
      return .iPadMini
    case "iPad4,4", "iPad4,5", "iPad4,6":
      return .iPadMini2
    case "iPad4,7", "iPad4,8", "iPad4,9":
      return .iPadMini3
    case "iPad5,1", "iPad5,2":
      return .iPadMini4
    case "iPad6,7", "iPad6,8", "iPad7,1", "iPad7,2":
      return .iPadPro12_9Inch
    case "iPad7,3", "iPad7,4":
      return .iPadPro10_5Inch
    case "iPad6,3", "iPad6,4":
      return .iPadPro9_7Inch
    case "iPad8,1", "iPad8,2", "iPad8,3", "iPad8,4":
      return .iPadPro11Inch
    case "iPad8,5", "iPad8,6", "iPad8,7", "iPad8,8":
      return .iPadPro12Inch3
      
    case "iPod1,1":
      return .iPodTouch1Gen
    case "iPod2,1":
      return .iPodTouch2Gen
    case "iPod3,1":
      return .iPodTouch3Gen
    case "iPod4,1":
      return .iPodTouch4Gen
    case "iPod5,1":
      return .iPodTouch5Gen
    case "iPod7,1":
      return .iPodTouch6Gen
      
    case "AppleTV5,3":
      return .AppleTV
    case "i386", "x86_64":
      return .simulator
      
    default:
      return .unknown
    }
  }
}
