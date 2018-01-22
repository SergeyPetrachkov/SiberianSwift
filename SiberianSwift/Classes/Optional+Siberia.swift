//
//  Optional+Siberia.swift
//  SiberianSwift
//
//  Created by Sergey Petfachkov on 22/01/2018.
//  Copyright © 2018 Paul Taykalo. All rights reserved.
//

import Foundation

public extension Optional {
  public func `or`(_ value : Wrapped?) -> Optional {
    return self ?? value
  }
  public func `or`(_ value: Wrapped) -> Wrapped {
    return self ?? value
  }
}
