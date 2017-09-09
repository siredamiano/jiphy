//
//  Meta.swift
//  JIPHY
//
//  Created by Damian A Torres on 9/7/17.
//  Copyright © 2017 Damian A Torres. All rights reserved.
//

import Foundation

struct Meta {
    let msg: String
    let status: Int
    let responseID: String
}

extension Meta {
    
    private enum Keys: String, SerializationKey {
        case msg
        case status
        case responseID = "response_id"
    }
    
    init(serialization: Serialization) {
        msg = serialization.value(forKey: Keys.msg)!
        status = serialization.value(forKey: Keys.status)!
        responseID = serialization.value(forKey: Keys.responseID)!
    }
}
