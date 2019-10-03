//
//  Track.swift
//  Chorus
//
//  Created by Dan Wartnaby on 01/10/2019.
//  Copyright © 2019 Dan Wartnaby. All rights reserved.
//

import UIKit

class Track: Decodable {
    var id: String?
    var title: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
    }
}
