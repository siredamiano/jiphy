//
//  User.swift
//  JIPHY
//
//  Created by Damian A Torres on 9/7/17.
//  Copyright © 2017 Damian A Torres. All rights reserved.
//

import Foundation

struct User {
    
    let avatarURL: URL?
    let bannerURL: URL?
    let profileURL: URL?
    let username: String
    let displayName: String
    let twitter: String
}

extension User {
    
    private enum Keys: String, SerializationKey {
        case avatarURL = "avatar_url"
        case bannerURL = "banner_url"
        case profileURL = "profile_url"
        case username
        case displayName = "display_name"
        case twitter
    }
    
    init(serialization: Serialization) {
        if let avatarURLString: String = serialization.value(forKey: Keys.avatarURL) {
            avatarURL = URL(string: avatarURLString)
        } else {
            avatarURL = nil
        }
        if let bannerURLString: String = serialization.value(forKey: Keys.bannerURL) {
            bannerURL = URL(string: bannerURLString)
        } else {
            bannerURL = nil
        }
        if let profileURLString: String = serialization.value(forKey: Keys.profileURL) {
            profileURL = URL(string: profileURLString)
        } else {
            profileURL = nil
        }
        username = serialization.value(forKey: Keys.username)!
        displayName = serialization.value(forKey: Keys.displayName)!
        twitter = serialization.value(forKey: Keys.twitter)!
    }

}
