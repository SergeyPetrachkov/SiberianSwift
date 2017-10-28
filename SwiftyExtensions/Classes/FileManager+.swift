//
//  FileManager+.swift
//  SwiftyExtensions
//
//  Created by sergey petrachkov on 09/12/2016.
//  Copyright © 2017 SwiftyExtensions. All rights reserved.
//

import Foundation

extension FileManager {
	func listFiles(path: String) -> [URL] {
		let baseurl: URL = URL(fileURLWithPath: path)
		var urls = [URL]()
		enumerator(atPath: path)?.forEach({ (e) in
			guard let s = e as? String else { return }
			let relativeURL = URL(fileURLWithPath: s, relativeTo: baseurl)
			let url = relativeURL.absoluteURL
			urls.append(url)
		})
		return urls
	}
}
