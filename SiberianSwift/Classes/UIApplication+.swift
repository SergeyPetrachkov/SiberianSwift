//
//  UIApplication+.swift
//  SiberianSwift
//
//  Created by Sergey Petrachkov on 28/10/2017.
//  Copyright © 2017 SiberianSwift. All rights reserved.
//

import Foundation

extension UIApplication {
  func amIBeingDebugged() -> Bool {
    var info = kinfo_proc()
    var mib : [Int32] = [CTL_KERN, KERN_PROC, KERN_PROC_PID, getpid()]
    var size = MemoryLayout.stride(ofValue: info)
    let junk = sysctl(&mib, UInt32(mib.count), &info, &size, nil, 0)
    assert(junk == 0, "sysctl failed")
    return (info.kp_proc.p_flag & P_TRACED) != 0
  }
}
