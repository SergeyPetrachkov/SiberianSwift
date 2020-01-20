//
//  Optional+Siberia.swift
//  SiberianSwift
//
//  Created by Sergey Petfachkov on 22/01/2018.
//  Copyright © 2018 Paul Taykalo. All rights reserved.
//

import Foundation

public extension Optional {
  
  func `or`(_ value : Wrapped?) -> Optional {
    return self ?? value
  }
  
  func `or`(_ value: Wrapped) -> Wrapped {
    return self ?? value
  }
}

public extension Optional where Wrapped == String {
  /// Check if your string is nil or empty
  func isNilOrEmpty() -> Bool {
    return self == nil || self == ""
  }
  /// Check if your string is nil or empty or whitespace
  func isNilOrWhiteSpace() -> Bool {
    return self.isNilOrEmpty() || self == " "
  }
}
