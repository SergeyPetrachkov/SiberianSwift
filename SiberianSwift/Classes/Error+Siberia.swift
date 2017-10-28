//
//  Error+.swift
//  SiberianSwift
//
//  Created by SergeyPetrachkov on 28/10/2017.
//  Copyright © 2017 SiberianSwift. All rights reserved.
//

import Foundation
extension Error {
  var code: Int { return (self as NSError).code }
}
