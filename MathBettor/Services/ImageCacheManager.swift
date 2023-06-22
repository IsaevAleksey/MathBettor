//
//  ImageCacheManager.swift
//  MathBettor
//
//  Created by Алексей Исаев on 27.05.2023.
//

import SwiftUI

final class ImageCacheManager {

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
