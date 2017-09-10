//
//  GIF.swift
//  JIPHY
//
//  Created by Damian A Torres on 9/7/17.
//  Copyright © 2017 Damian A Torres. All rights reserved.
//

import Foundation

struct GIF {

    let type: String
    let id: String
    let slug: String
    let url: URL?
    let bitlyUrl: URL?
    let username: String?
    let source: String
    let rating: String
    let user: User?
    let sourceTopLevelDomain: String
    let sourcePostURL: URL?
    let importDateTime: String?
    let trendingDateTime: String?
    let images: Images
}

extension GIF {

    private enum Keys: String, SerializationKey {
        case type
        case id
        case slug
        case url
        case bitlyUrl = "bitly_url"
        case username
        case source
        case rating
        case user
        case sourceTopLevelDomain = "source_tld"
        case sourcePostURL = "source_post_url"
        case importDateTime = "import_datetime"
        case trendingDateTime = "trending_datetime"
        case images
    }
    
    init(serialization: Serialization) {
        type = serialization.value(forKey: Keys.type)!
        id = serialization.value(forKey: Keys.id)!
        slug = serialization.value(forKey: Keys.slug)!
        if let gifURL: String = serialization.value(forKey: Keys.url) {
            url = URL(string: gifURL)
        } else {
            url = nil
        }
        if let bitlyGIFURL: String = serialization.value(forKey: Keys.bitlyUrl) {
            bitlyUrl = URL(string: bitlyGIFURL)
        } else {
            bitlyUrl = nil
        }
        username = serialization.value(forKey: Keys.username)!
        source = serialization.value(forKey: Keys.source)!
        rating = serialization.value(forKey: Keys.rating)!
        if let userSerialization: Serialization = serialization.value(forKey: Keys.user) {
            user = User(serialization: userSerialization)
        } else {
            user = nil
        }
        sourceTopLevelDomain = serialization.value(forKey: Keys.sourceTopLevelDomain)!
        if let sourcePostURLString: String = serialization.value(forKey: Keys.sourcePostURL) {
            sourcePostURL = URL(string: sourcePostURLString)
        } else {
            sourcePostURL = nil
        }
        importDateTime = serialization.value(forKey: Keys.importDateTime)
        trendingDateTime = serialization.value(forKey: Keys.trendingDateTime)
        let imageSerialization:Serialization = serialization.value(forKey: Keys.images)!
        images = Images(serialization: imageSerialization)
    }

}
