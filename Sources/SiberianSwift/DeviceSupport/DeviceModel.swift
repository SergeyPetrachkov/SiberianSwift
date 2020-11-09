//
//  DeviceModel.swift
//  SiberianSwift
//
//  Created by Sergey Petrachkov on 29/10/2017.
//  Copyright © 2017 Sergey Petrachkov. All rights reserved.
//

import Foundation
import UIKit

public enum DeviceModel: String {
  // MARK: - iPhones
  case iPhone4
  case iPhone4S
  case iPhone5
  case iPhone5C
  case iPhone5S
  case iPhone6
  case iPhone6Plus
  case iPhone6S
  case iPhone6SPlus
  case iPhoneSE
  case iPhone7
  case iPhone7Plus
  case iPhone8
  case iPhone8Plus
  case iPhoneX
  case iPhoneXS
  case iPhoneXSMax
  case iPhoneXR
  case iPhone11
  case iPhone11Pro
  case iPhone11ProMax
  case iPhoneSE2
  case iPhone12
  case iPhone12Mini
  case iPhone12Pro
  case iPhone12ProMax
  
  // MARK: - iPads
  case iPad1
  case iPad2
  case iPad3
  case iPad4
  case iPad5
  case iPadAir
  case iPadAir2
  case iPadMini
  case iPadMini2
  case iPadMini3
  case iPadMini4
  case iPadMini5
  case iPadPro9_7Inch
  case iPadPro10_5Inch
  case iPadPro12_9Inch
  case iPadPro11Inch
  case iPadPro12Inch3
  
  // MARK: - iPods
  case iPodTouch1Gen
  case iPodTouch2Gen
  case iPodTouch3Gen
  case iPodTouch4Gen
  case iPodTouch5Gen
  case iPodTouch6Gen
  
  // MARK: - Apple TV
  case AppleTV
  
  case simulator
  case unknown

  var diagonal: Double {
    switch self {
    case .iPhone4: return 3.5
    case .iPhone4S: return 3.5
    case .iPhone5: return 4
    case .iPhone5C: return 4
    case .iPhone5S: return 4
    case .iPhone6: return 4.7
    case .iPhone6Plus: return 5.5
    case .iPhone6S: return 4.7
    case .iPhone6SPlus: return 5.5
    case .iPhone7: return 4.7
    case .iPhone7Plus: return 5.5
    case .iPhoneSE: return 4
    case .iPhone8: return 4.7
    case .iPhone8Plus: return 5.5
    case .iPhoneX: return 5.8
    case .iPhoneXS: return 5.8
    case .iPhoneXSMax: return 6.5
    case .iPhoneXR: return 6.1
    case .iPhone11: return 6.1
    case .iPhone11Pro: return 5.8
    case .iPhone11ProMax: return 6.5
    case .iPhoneSE2: return 4.7
    case .iPhone12: return 6.1
    case .iPhone12Mini: return 5.4
    case .iPhone12Pro: return 6.1
    case .iPhone12ProMax: return 6.7
    case .iPad2: return 9.7
    case .iPad3: return 9.7
    case .iPad4: return 9.7
    case .iPadAir: return 9.7
    case .iPadAir2: return 9.7
    case .iPad5: return 9.7
    case .iPadMini: return 7.9
    case .iPadMini2: return 7.9
    case .iPadMini3: return 7.9
    case .iPadMini4: return 7.9
    case .iPadMini5: return 7.9
    case .iPadPro11Inch: return 11.0
    case .iPadPro12Inch3: return 12.9
    default: return -1
    }
  }
}
