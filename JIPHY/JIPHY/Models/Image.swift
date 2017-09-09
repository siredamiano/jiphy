//
//  Image.swift
//  JIPHY
//
//  Created by Damian A Torres on 9/7/17.
//  Copyright © 2017 Damian A Torres. All rights reserved.
//

import Foundation

struct Image {
    let url: String
    let width: Int
    let height: Int
    let size: Int
    let mp4: String
    let mp4Size: Int
    let webp: String
    let webpSize: Int
    
    enum ImageObject: String, SerializationKey {
        case FixedHeight = "fixed_height"
        case FixedHeightStill
        case FixedHeightDownsampled
        case FixedWidth
        case FixedWidthStill
        case FixedWidthDownsampled
        case Looping
        case Preview
        case PreviewGIF
    }
    
}

