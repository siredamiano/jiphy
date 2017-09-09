//
//  Image.swift
//  JIPHY
//
//  Created by Damian A Torres on 9/7/17.
//  Copyright © 2017 Damian A Torres. All rights reserved.
//

import Foundation

struct Images {
    let fixedHeight: FixedHeight
    let fixedHeightStill: FixedHeightStill
    let fixedHeightDownsampled: FixedHeightDownsampled
    let fixedWidth: FixedWidth
    let fixedWidthStill: FixedWidthStill
    let fixedWidthDownsampled: FixedWidthDownsampled
}

extension Images {

    private enum Keys: String, SerializationKey {
        case FixedHeight = "fixed_height"
        case FixedHeightStill = "fixed_height_still"
        case FixedHeightDownsampled = "fixed_height_downsampled"
        case FixedWidth = "fixed_width"
        case FixedWidthStill = "fixed_width_still"
        case FixedWidthDownsampled = "fixed_width_downsampled"
    }
    
    init(serialization: Serialization) {
        if let fixedHeightSerialization: Serialization = serialization.value(forKey: Keys.FixedHeight) {
            fixedHeight = FixedHeight(serialization: fixedHeightSerialization)
        }
        if let fixedHeightStillSerialization: Serialization = serialization.value(forKey: Keys.FixedHeightStill) {
            fixedHeightStill = FixedHeightStill(serialization: fixedHeightStillSerialization)
        }
        if let fixedHeightDownsampledSerialization: Serialization = serialization.value(forKey: Keys.FixedHeightDownsampled) {
            fixedHeightDownsampled = FixedHeightDownsampled(serialization: fixedHeightDownsampledSerialization)
        }
        if let fixedWidthSerialization: Serialization = serialization.value(forKey: Keys.FixedWidth) {
            fixedWidth = FixedWidth(serialization: fixedWidthSerialization)
        }
        if let fixedWidthStillSerialization: Serialization = serialization.value(forKey: Keys.FixedWidthStill) {
            fixedWidthStill = FixedWidthStill(serialization: fixedWidthStillSerialization)
        }
        if let fixedWidthDownsampledSerialization: Serialization = serialization.value(forKey: Keys.FixedWidthDownsampled) {
            fixedWidthDownsampled = FixedWidthDownsampled(serialization: fixedWidthDownsampledSerialization)
        }
    }
    
}

class ImageProperties {

    var url: URL
    var width: Int = 0
    var height: Int = 0
    var size: Int? = nil
    var mp4: String? = nil
    var mp4Size: Int? = nil
    var webp: String? = nil
    var webpSize: Int? = nil
    
    init(url: URL, width: Int, height: Int, size: Int, mp4: String, mp4Size: Int, webp: String, webpSize: Int) {
        self.url = url
        self.width = width
        self.height = height
        self.size = size
        self.mp4 = mp4
        self.mp4Size = mp4Size
        self.webp = webp
        self.webpSize = webpSize
    }
}

extension ImageProperties {
    
    private enum Keys: String, SerializationKey {
        case url
        case width
        case height
        case size
        case mp4
        case mp4Size = "mp4_size"
        case webp
        case webpSize = "webp_size"
    }
    
    convenience init(serialization: Serialization) {
        self.url = URL(string: serialization.value(forKey: Keys.url)!)!
        self.width = serialization.value(forKey: Keys.width)!
        self.height = serialization.value(forKey: Keys.height)!
        self.size = serialization.value(forKey: Keys.size)!
        self.mp4 = serialization.value(forKey: Keys.mp4)!
        self.mp4Size = serialization.value(forKey: Keys.mp4Size)!
        self.webp = serialization.value(forKey: Keys.webp)!
        self.webpSize = serialization.value(forKey: Keys.webpSize)!
    }
}

class FixedHeight: ImageProperties { }

class FixedHeightStill: ImageProperties {
    convenience init(url: URL, width: Int, height: Int) {
        self.init(url: url, width: width, height: height, size: 0, mp4: "", mp4Size: 0, webp: "", webpSize: 0)
    }
}

class FixedHeightDownsampled: ImageProperties {
    convenience init(url: URL, width: Int, height: Int, size: Int, webp: String, webpSize: Int) {
        self.init(url: url, width: width, height: height, size: size, mp4: "", mp4Size: 0, webp: webp, webpSize: webpSize)
    }
}

class FixedWidth: ImageProperties { }

class FixedWidthStill: ImageProperties {
    convenience init(url: URL, width: Int, height: Int) {
        self.init(url: url, width: width, height: height, size: 0, mp4: "", mp4Size: 0, webp: "", webpSize: 0)
    }
}

class FixedWidthDownsampled: ImageProperties {
    convenience init(url: URL, width: Int, height: Int, size: Int, webp: String, webpSize: Int) {
        self.init(url: url, width: width, height: height, size: size, mp4: "", mp4Size: 0, webp: webp, webpSize: webpSize)
    }
}




