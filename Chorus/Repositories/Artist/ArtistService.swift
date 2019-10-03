//
//  ArtistService.swift
//  Chorus
//
//  Created by Dan Wartnaby on 01/10/2019.
//  Copyright © 2019 Dan Wartnaby. All rights reserved.
//

import UIKit

protocol ArtistService: Service {
    func findArtist(named name: String, completion: @escaping (Artist?) -> ())
    func fetchAlbums(forArtist artist: Artist, completion: @escaping ([Album]) -> ())
}
