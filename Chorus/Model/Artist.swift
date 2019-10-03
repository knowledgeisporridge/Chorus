//
//  Artist.swift
//  Chorus
//
//  Created by Dan Wartnaby on 01/10/2019.
//  Copyright © 2019 Dan Wartnaby. All rights reserved.
//

import UIKit

struct Artist: Decodable {
    var id: String?
    var name: String
    var score: Int?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case score
    }
    
    init(name: String) {
        self.name = name
    }
}
