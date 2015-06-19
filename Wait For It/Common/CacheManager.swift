//
//  CacheManager.swift
//  Wait For It
//
//  Created by Brian Anderson on 6/11/15.
//  Copyright (c) 2015 Solstice Mobile. All rights reserved.
//

import Foundation

class CacheManager {
    static let sharedInstance = CacheManager()

    var cache: NSCache = NSCache()

    private init() {}
}
