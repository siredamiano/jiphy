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
    let url: String
    let bitlyUrl: String
    let username: String
    let source: String
    let rating: String
    let contentURL: String
    let tags: [String]
    let featureTags: [String]
    let user: User
    let sourceTopLevelDomain: String
    let updateDateTime: Date
    let createDateTime: Date
    let importDateTime: Date
    let trendingDateTime: Date
    let images: [String]
    let pagination: Pagination
    let meta: Meta

}
