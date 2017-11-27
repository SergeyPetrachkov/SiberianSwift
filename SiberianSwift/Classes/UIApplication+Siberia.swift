//
//  UIApplication+Siberia.swift
//  SiberianSwift
//
//  Created by Sergey Petrachkov on 28/10/2017.
//  Copyright © 2017 SiberianSwift. All rights reserved.
//

import Foundation

public extension UIApplication {
  /// Detect if debugger is attached.
  /// In some cases you would want to know that and maybe disable/enable something
  public func amIBeingDebugged() -> Bool {
    var info = kinfo_proc()
    var mib : [Int32] = [CTL_KERN, KERN_PROC, KERN_PROC_PID, getpid()]
    var size = MemoryLayout.stride(ofValue: info)
    let junk = sysctl(&mib, UInt32(mib.count), &info, &size, nil, 0)
    assert(junk == 0, "sysctl failed")
    return (info.kp_proc.p_flag & P_TRACED) != 0
  }
  
  public static var appVersion: String {
    if let appVersion = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") {
      return "\(appVersion)"
    } else {
      return ""
    }
  }
  
  public static var build: String {
    if let buildVersion = Bundle.main.object(forInfoDictionaryKey: kCFBundleVersionKey as String) {
      return "\(buildVersion)"
    } else {
      return ""
    }
  }
  /// Returns version in v1.0 29 format
  public static var formattedVersion: String {
    let version = UIApplication.appVersion
    let build = UIApplication.build
    
    var versionAndBuild = "v\(version)"
    
    if version != build {
      versionAndBuild = "v\(version) (\(build))"
    }
    
    return versionAndBuild
  }
}
