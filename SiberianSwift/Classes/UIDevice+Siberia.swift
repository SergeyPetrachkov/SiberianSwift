//
//  UIDevice+Siberia.swift
//  SiberianSwift
//
//  Created by SergeyPetrachkov on 28/10/2017
//  Copyright © 2017 SiberianSwift. All rights reserved.
//

import Foundation
import UIKit

extension UIDevice {
  
    var iPhone: Bool {
        return UIDevice().userInterfaceIdiom == .phone
    }
    
    public enum ScreenType: String {
        /// iPhone 4 and 4s screen
        case iPhone4
        /// iPhone 5, 5C, 5S, SE screen
        case iPhone5
        /// iPhone 6, 6S, 7, 8 screen size
        case iPhone375
        /// iPhone 6, 6S, 7, 8 screen size (zoomed mode)
        case iPhone375Zoomed
        /// iPhone 6,7,8 Plus  screen size
        case iPhonePlus
        /// iPhone 6,7,8 Plus screen size (zoomed mode)
        case iPhonePlusZoomed
        /// iPhone X
        case iPhoneX
        /// Unrecognized screen size
        case unrecognized
    }
    
    /// Device screen type
    var screenType: ScreenType {
        guard iPhone else { return ScreenType.unrecognized; }
        
        let mainScreen = UIScreen.main;
        
        let isIOS8OrLater = SYSTEM_VERSION_GREATER_THAN("8.0");
        let screenBoundsHeight = mainScreen.bounds.height;
        let screenNativeScale = mainScreen.nativeScale;
        let screenScale = mainScreen.scale;
        
        if (screenBoundsHeight == 568.0
            && ((isIOS8OrLater && screenNativeScale == screenScale)
                || !isIOS8OrLater)) {
            return .iPhone5;
        } else if (screenBoundsHeight == 667.0
            && isIOS8OrLater
            && screenNativeScale == screenScale) {
            return .iPhone375;
        } else if (screenBoundsHeight == 568.0
            && isIOS8OrLater
            && screenNativeScale > screenScale) {
            return .iPhone375Zoomed;
        } else if (screenBoundsHeight == 736.0) {
            return .iPhonePlus;
        } else if (screenBoundsHeight == 667.0
            && isIOS8OrLater
            && screenNativeScale < screenScale) {
            return .iPhonePlusZoomed;
        }
        /// check fo x
        else {
            return .iPhone4;
        }
    }
    
    var isSmallScreen : Bool {
        return screenType == .iPhone4 || screenType == .iPhone5 || screenType == .iPhonePlusZoomed;
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
    var modelName: String {
        var systemInfo = utsname()
        uname(&systemInfo)
        let machineMirror = Mirror(reflecting: systemInfo.machine)
        let identifier = machineMirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8 , value != 0 else { return identifier }
            return identifier + String(UnicodeScalar(UInt8(value)))
        }
        switch identifier {
        case "iPod5,1":
            return "iPod Touch 5"
        case "iPod7,1":
            return "iPod Touch 6"
        case "iPhone3,1", "iPhone3,2", "iPhone3,3":
            return "iPhone 4"
        case "iPhone4,1":
            return "iPhone 4s"
        case "iPhone5,1", "iPhone5,2":
            return "iPhone 5"
        case "iPhone5,3", "iPhone5,4":
            return "iPhone 5c"
        case "iPhone6,1", "iPhone6,2":
            return "iPhone 5s"
        case "iPhone7,2":
            return "iPhone 6"
        case "iPhone7,1":
            return "iPhone 6 Plus"
        case "iPhone8,1":
            return "iPhone 6s"
        case "iPhone8,2":
            return "iPhone 6s Plus"
        case "iPhone9,1", "iPhone9,3":
            return "iPhone 7"
        case "iPhone9,2", "iPhone9,4":
            return "iPhone 7 Plus"
        case "iPhone8,4":
            return "iPhone SE"
        case "iPad2,1", "iPad2,2", "iPad2,3", "iPad2,4":
            return "iPad 2"
        case "iPad3,1", "iPad3,2", "iPad3,3":
            return "iPad 3"
        case "iPad3,4", "iPad3,5", "iPad3,6":
            return "iPad 4"
        case "iPad4,1", "iPad4,2", "iPad4,3":
            return "iPad Air"
        case "iPad5,3", "iPad5,4":
            return "iPad Air 2"
        case "iPad2,5", "iPad2,6", "iPad2,7":
            return "iPad Mini"
        case "iPad4,4", "iPad4,5", "iPad4,6":
            return "iPad Mini 2"
        case "iPad4,7", "iPad4,8", "iPad4,9":
            return "iPad Mini 3"
        case "iPad5,1", "iPad5,2":
            return "iPad Mini 4"
        case "iPad6,7", "iPad6,8":
            return "iPad Pro"
        case "AppleTV5,3":
            return "Apple TV"
        case "i386", "x86_64":
            return "Simulator"
        default:
            return identifier
        }
    }
}
