//
//  Image.swift
//  JIPHY
//
//  Created by Damian A Torres on 9/7/17.
//  Copyright © 2017 Damian A Torres. All rights reserved.
//

import Foundation

struct Images {
    var fixedHeight: FixedHeight? = nil
    var fixedHeightStill: FixedHeightStill? = nil
    var fixedHeightDownsampled: FixedHeightDownsampled? = nil
    var fixedWidth: FixedWidth? = nil
    var fixedWidthStill: FixedWidthStill? = nil
    var fixedWidthDownsampled: FixedWidthDownsampled? = nil
    var fixedWidthSmall: FixedWidthSmall? = nil
    var fixedWidthSmallStill: FixedWidthSmallStill? = nil
    var fixedHeightSmall: FixedHeightSmall? = nil
    var fixedHeightSmallStill: FixedHeightSmallStill? = nil
}

extension Images {

    private enum Keys: String, SerializationKey {
        case FixedHeight = "fixed_height"
        case FixedHeightStill = "fixed_height_still"
        case FixedHeightDownsampled = "fixed_height_downsampled"
        case FixedWidth = "fixed_width"
        case FixedWidthStill = "fixed_width_still"
        case FixedWidthDownsampled = "fixed_width_downsampled"
        case FixedHeightSmall = "fixed_height_small"
        case FixedHeightSmallStill = "fixed_height_small_still"
        case FixedWidthSmall = "fixed_width_small"
        case FixedWidthSmallStill = "fixed_width_small_still"
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
        if let fixedWidthSmallSerialization: Serialization = serialization.value(forKey: Keys.FixedWidthSmall) {
            fixedWidthSmall = FixedWidthSmall(serialization: fixedWidthSmallSerialization)
        }
        if let fixedWidthSmallStillSerialization: Serialization = serialization.value(forKey: Keys.FixedWidthSmallStill) {
            fixedWidthSmallStill = FixedWidthSmallStill(serialization: fixedWidthSmallStillSerialization)
        }
        if let fixedHeightSmallSerialization: Serialization = serialization.value(forKey: Keys.FixedHeightSmall) {
            fixedHeightSmall = FixedHeightSmall(serialization: fixedHeightSmallSerialization)
        }
        if let fixedHeightSmallStillSerialization: Serialization = serialization.value(forKey: Keys.FixedHeightSmallStill) {
            fixedHeightSmallStill = FixedHeightSmallStill(serialization: fixedHeightSmallStillSerialization)
        }
        
    }
    
}

class ImageProperties {

    var url: URL
    var width: Int
    var height: Int
    var size: Int?
    var mp4: String?
    var mp4Size: Int?
    var webp: String?
    var webpSize: Int?
    
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
        self.init(url: URL(string: "bruh")!, width: 0, height: 0, size: 0, mp4: "", mp4Size: 0, webp: "", webpSize: 0)
        self.url = URL(string: serialization.value(forKey: Keys.url)!)!
        self.width = Int(serialization.value(forKey: Keys.width)!)!
        self.height = Int(serialization.value(forKey: Keys.height)!)!
        if let sizeString: String = serialization.value(forKey: Keys.size) {
            self.size = Int(sizeString)
        } else {
            self.size = 0
        }
        self.mp4 = serialization.value(forKey: Keys.mp4)
        if let mp4SizeString: String = serialization.value(forKey: Keys.mp4Size) {
            self.mp4Size = Int(mp4SizeString)
        } else {
            self.mp4Size = 0
        }
        self.webp = serialization.value(forKey: Keys.webp)
        if let webpSizeString: String = serialization.value(forKey: Keys.webpSize) {
            self.webpSize = Int(webpSizeString)
        } else {
            self.webpSize = 0
        }
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

class FixedWidthSmall: ImageProperties { }

class FixedWidthSmallStill: ImageProperties {
    convenience init(url: URL, width: Int, height: Int) {
        self.init(url: url, width: width, height: height, size: 0, mp4: "", mp4Size: 0, webp: "", webpSize: 0)
    }
}

class FixedHeightSmall: ImageProperties { }

class FixedHeightSmallStill: ImageProperties {
    convenience init(url: URL, width: Int, height: Int) {
        self.init(url: url, width: width, height: height, size: 0, mp4: "", mp4Size: 0, webp: "", webpSize: 0)
    }
}




