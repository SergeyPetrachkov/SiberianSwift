//
//  Array+Siberia.swift
//  SiberianSwift
//
//  Created by Sergey Petrachkov on 17/10/2018.
//  Copyright © 2018 Sergey Petrachkov. All rights reserved.
//

import Foundation

public extension Array where Element : Equatable {
  mutating func mergeElements<C : Collection>(newElements: C) where C.Iterator.Element == Element {
    let filteredList = newElements.filter({!self.contains($0)})
    self.append(contentsOf: filteredList)
  }
}
