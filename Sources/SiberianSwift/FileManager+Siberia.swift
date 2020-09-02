//
//  FileManager+Siberia.swift
//  SiberianSwift
//
//  Created by sergey petrachkov on 09/12/2016.
//  Copyright © 2017 SiberianSwift. All rights reserved.
//

import Foundation

public extension FileManager {
  @available(iOS 9.0, OSX 10.11, *)
  func listFiles(path: String) -> [URL] {
		let baseUrl: URL = URL(fileURLWithPath: path)
		var urls = [URL]()
		enumerator(atPath: path)?.forEach({ (e) in
			guard let s = e as? String else { return }
			let relativeURL = URL(fileURLWithPath: s, relativeTo: baseUrl)
			let url = relativeURL.absoluteURL
			urls.append(url)
		})
		return urls
	}
}
