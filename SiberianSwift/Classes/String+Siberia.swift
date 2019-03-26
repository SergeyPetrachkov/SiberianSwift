//
//  String+Siberia.swift
//  SiberianSwift
//
//  Created by Sergey Petrachkov on 28.10.2017
//  Copyright © 2017 SiberianSwift. All rights reserved.
//

import UIKit

public extension String {
  /// From string 'Sergey Petrachkov' it will return 'SP'
  var initials: String {
    var finalString = String()
    var words = components(separatedBy: .whitespacesAndNewlines)
    
    if let firstCharacter = words.first?.first {
      finalString.append(String(firstCharacter))
      words.removeFirst()
    }
    
    if let lastCharacter = words.last?.first {
      finalString.append(String(lastCharacter))
    }
    
    return finalString.uppercased()
  }
  
  /// Get a random string of a given length
  /// - parameters:
  ///   - length: desired length
	static func randomString(length: Int) -> String {
		let letters : NSString = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
		let len = UInt32(letters.length)
		
		var randomString = ""
		
		for _ in 0 ..< length {
			let rand = arc4random_uniform(len)
			var nextChar = letters.character(at: Int(rand))
			randomString += NSString(characters: &nextChar, length: 1) as String
		}
		return randomString
	}
	
	/// Get localized version of string by key
  ///
  ///
  ///     let hello = "my_localized_hello".localized
  ///     // returns "Hello from Siberia!" if you have it in your .strings :)
	var localized : String {
		return NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: "")
	}
  
  /// Get length of a string
  @available(*, deprecated)
  var length: Int {
    return self.count
  }

	/// Returns matches for a given regular expression
	/// - parameters:
	///		- regex: regular expression in string format
	/// - returns: string array of matches
	func matches(for regex: String) -> [String] {
		do {
			let regex = try NSRegularExpression(pattern: regex)
			let nsString = self as NSString
			let results = regex.matches(in: self, range: NSRange(location: 0, length: nsString.length))
			return results.map { nsString.substring(with: $0.range)}
		} catch let error {
			print("invalid regex: \(error.localizedDescription)")
			return []
		}
	}
    
  func capturedGroups(withRegex pattern: String) -> [String] {
    var results = [String]()
    
    var regex: NSRegularExpression
    do {
        regex = try NSRegularExpression(pattern: pattern, options: [])
    } catch {
        return results
    }
    
    let matches = regex.matches(in: self, options: [], range: NSRange(location:0, length: self.count))
    
    guard let match = matches.first else { return results }
    
    let lastRangeIndex = match.numberOfRanges - 1
    guard lastRangeIndex >= 1 else { return results }
    
    for i in 1...lastRangeIndex {
        let capturedGroupIndex = match.range(at: i)
        let matchedString = (self as NSString).substring(with: capturedGroupIndex)
        results.append(matchedString)
    }
    return results
  }

	func regexMatches(pattern: String) -> Array<String> {
		let regex: NSRegularExpression
		do {
			regex = try NSRegularExpression(pattern: pattern, options: [])
		} catch {
			return []
		}
		
		let matches = regex.matches(in: self, options: [], range: NSRange(location: 0, length: self.utf16.count))
		var collectMatches: Array<String> = []
		for match in matches {
			// range at index 0: full match
			// range at index 1: first capture group
			let substring = (self as NSString).substring(with: match.range(at: 1))
			collectMatches.append(substring)
		}
		return collectMatches
	}
	
	func index(of string: String) -> String.Index? {
		return range(of: string)?.lowerBound
	}
  
  /**
   Truncates the string to the specified length number of characters and appends an optional trailing string if longer.
   
   - Parameter length: A `String`.
   - Parameter trailing: A `String` that will be appended after the truncation.
   
   - Returns: A `String` object.
   */
  func truncate(length: Int, truncationToken: String = "") -> String {
    if self.count > length {
      return String(self.prefix(length)) + truncationToken
    } else {
      return self
    }
  }
  
  func height(withConstrainedWidth width: CGFloat, font: UIFont) -> CGFloat {
    let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
    let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [.font: font], context: nil)
    
    return ceil(boundingBox.height)
  }
  
  func width(withConstraintedHeight height: CGFloat, font: UIFont) -> CGFloat {
    let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
    let boundingBox = self.boundingRect(with: constraintRect,
                                        options: .usesLineFragmentOrigin,
                                        attributes: [.font: font],
                                        context: nil)
    
    return ceil(boundingBox.width)
  }
  
  static func bulletList(from strings: [String]) -> String {
    return strings.map({ $0.bulleted() }).joined(separator: "\n\r")
  }
  
  func bulleted() -> String {
    return "\u{2022} " + self
  }
}
