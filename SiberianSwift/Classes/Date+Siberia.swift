//
//  Date+Siberia.swift
//  SiberianSwift
//
//  Created by Sergey Petrachkov on 28/10/2017.
//  Copyright © 2017 SiberianSwift. All rights reserved.
//

import Foundation

extension Date {
  func dayNumberOfWeek() -> Int? {
    return Calendar.current.dateComponents([.weekday], from: self).weekday
  }
}
