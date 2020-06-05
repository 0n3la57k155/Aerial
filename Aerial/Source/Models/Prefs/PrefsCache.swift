//
//  PrefsCache.swift
//  Aerial
//
//  Created by Guillaume Louel on 03/06/2020.
//  Copyright © 2020 Guillaume Louel. All rights reserved.
//

import Foundation

enum CacheMode: Int, Codable {
    case manual, rotate
}

enum CachePeriodicity: Int, Codable {
    case weekly, monthly
}

struct PrefsCache {
    // Cache limit (in GiB)
    @SimpleStorage(key: "cacheLimit", defaultValue: 5)
    static var cacheLimit: Double

    // Cache management mode
    @SimpleStorage(key: "intCacheMode", defaultValue: CacheMode.manual.rawValue)
    static var intCacheMode: Int

    // We wrap in a separate value, as we can't store an enum as a Codable in
    // macOS < 10.15
    static var cacheMode: CacheMode {
        get {
            return CacheMode(rawValue: intCacheMode)!
        }
        set(value) {
            intCacheMode = value.rawValue
        }
    }

    // How often should cache gets refreshed
    @SimpleStorage(key: "intCachePeriodicity", defaultValue: CachePeriodicity.monthly.rawValue)
    static var intCachePeriodicity: Int

    // We wrap in a separate value, as we can't store an enum as a Codable in
    // macOS < 10.15
    static var cachePeriodicity: CachePeriodicity {
        get {
            return CachePeriodicity(rawValue: intCachePeriodicity)!
        }
        set(value) {
            intCachePeriodicity = value.rawValue
        }
    }
}
