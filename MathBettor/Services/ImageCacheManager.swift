//
//  ImageCacheManager.swift
//  MathBettor
//
//  Created by Алексей Исаев on 27.05.2023.
//

import SwiftUI

class ImageCacheManager {

    static private var cache: [String: Image] = [:]

    static subscript(url: String) -> Image? {
        get {
            ImageCacheManager.cache[url]
        }
        set {
            ImageCacheManager.cache[url] = newValue
        }
    }
}

class ImageCacheM {
    static let shared = NSCache<NSString, UIImage>()
    
    private init() {}
}

class URLImageCache {
    static let cache = URLCache.init(memoryCapacity: 50_000_000, diskCapacity: 1_000_000_000)
    
    private init() {}
//    let cache2 = URLCache.shared
//    cache.memoryCapacity = 50_000_000
//    cache.diskCapacity = 1_000_000_000
}
