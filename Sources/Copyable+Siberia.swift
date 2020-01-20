//
//  Copyable+Siberia.swift
//  SiberianSwift
//
//  Created by Sergey Petrachkov on 27/11/2017.
//  Copyright © 2017 Sergey Petrachkov. All rights reserved.
//

import Foundation

public protocol Copyable {
  init(other: Self)
}

public extension Copyable {
  func copy() -> Self {
    return Self.init(other: self)
  }
}
