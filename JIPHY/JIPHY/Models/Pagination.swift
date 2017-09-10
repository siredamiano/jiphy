//
//  Pagination.swift
//  JIPHY
//
//  Created by Damian A Torres on 9/7/17.
//  Copyright © 2017 Damian A Torres. All rights reserved.
//

import Foundation

struct Pagination {
    
    let offset: Int
    let totalCount: Int?
    let count: Int
    
}

extension Pagination {
    private enum Keys: String, SerializationKey {
        case offset
        case totalCount = "total_count"
        case count
    }
    
    init(serialization: Serialization) {
        offset = serialization.value(forKey: Keys.offset)!
        totalCount = serialization.value(forKey: Keys.totalCount)
        count = serialization.value(forKey: Keys.count)!
    }

}
