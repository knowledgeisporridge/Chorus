//
//  ArtistRepository.swift
//  Chorus
//
//  Created by Dan Wartnaby on 01/10/2019.
//  Copyright © 2019 Dan Wartnaby. All rights reserved.
//

import UIKit

class ArtistRepository: NSObject {
    private var artistService: ArtistService
    
    init(artistService: ArtistService) {
        self.artistService = artistService
    }
    
    func findArtist(named name: String, completion: @escaping (Artist?) -> ()) {
        artistService.findArtist(named: name, completion: completion)
    }
    
    func fetchAlbums(forArtist artist: Artist, completion: @escaping ([Album]) -> ()) {
        artistService.fetchAlbums(forArtist: artist, completion: completion)
    }
}
