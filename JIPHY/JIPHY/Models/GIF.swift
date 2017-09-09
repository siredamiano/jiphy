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
    let tags: [String]
    let featureTags: [String]
    let user: User?
    let sourceTopLevelDomain: String
    let sourcePostURL: URL?
    let updateDateTime: Date
    let createDateTime: Date
    let importDateTime: Date
    let trendingDateTime: Date
    let images: [Image]
    let pagination: Pagination?
    let meta: Meta?

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
        case tags
        case featureTags = "feature_tags"
        case user
        case sourceTopLevelDomain = "source_tld"
        case sourcePostURL = "source_post_url"
        case updateDateTime = "update_datetime"
        case createDateTime = "create_datetime"
        case importDateTime = "import_datetime"
        case trendingDateTime = "trending_datetime"
        case images
        case pagination
        case meta
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
        tags = serialization.value(forKey: Keys.tags)!
        featureTags = serialization.value(forKey: Keys.featureTags)!
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
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd hh:mm:ss"
        updateDateTime = dateFormatter.date(from: serialization.value(forKey: Keys.updateDateTime)!)!
        createDateTime = dateFormatter.date(from: serialization.value(forKey: Keys.createDateTime)!)!
        importDateTime = dateFormatter.date(from: serialization.value(forKey: Keys.importDateTime)!)!
        trendingDateTime = dateFormatter.date(from: serialization.value(forKey: Keys.trendingDateTime)!)!
        // array of images here
        if let paginationSerialization: Serialization = serialization.value(forKey: Keys.pagination) {
            pagination = Pagination(serialization: paginationSerialization)
        } else {
            pagination = nil
        }
        if let metaSerialization: Serialization = serialization.value(forKey: Keys.meta) {
            meta = Meta(serialization: metaSerialization)
        } else {
            meta = nil
        }
    }
}
