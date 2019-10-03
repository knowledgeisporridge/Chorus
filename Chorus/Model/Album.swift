//
//  Album.swift
//  Chorus
//
//  Created by Dan Wartnaby on 01/10/2019.
//  Copyright © 2019 Dan Wartnaby. All rights reserved.
//

import UIKit

struct Album: Decodable {
    var id: String?
    var title: String?
    var status: String?
    var media: [AlbumMedia]?
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case status
        case media
    }
}


struct AlbumMedia: Decodable {
    enum Format: String {
        case CD
        case Cassette
    }
        
    var format: String?
    var tracks: [Track]?
    
    enum CodingKeys: String, CodingKey {
        case format
        case tracks
    }
}
