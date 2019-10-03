//
//  WebArtistService.swift
//  Chorus
//
//  Created by Dan Wartnaby on 01/10/2019.
//  Copyright © 2019 Dan Wartnaby. All rights reserved.
//

import UIKit


class WebArtistService: ArtistService {
    private let artistEndpoint = "https://musicbrainz.org/ws/2/artist"
    private let albumsEndpoint = "https://musicbrainz.org/ws/2/release"
    
    func findArtist(named name: String, completion: @escaping (Artist?) -> ()) {
        invoke(endpoint: artistEndpoint, parameters: ["query": name], success: { (data, response) in
            guard let data = data,
                  let artistsResponse = try? JSONDecoder().decode(WebArtistsResponse.self, from: data) else {
                completion(nil); return
            }
            
            completion(artistsResponse.artists.sorted(by: { $0.score ?? 0 > $1.score ?? 0 }).first)
        }, failure: { (error) in
            completion(nil)
        })
    }
    
    func fetchAlbums(forArtist artist: Artist, completion: @escaping ([Album]) -> ()) {
        invoke(endpoint: albumsEndpoint, parameters: ["artist": artist.id!, "inc": "recordings"], success: { (data, response) in
            guard let data = data,
                  let albumsResponse = try? JSONDecoder().decode(WebAlbumsResponse.self, from: data) else {
                completion([]); return
            }
            
            completion(albumsResponse.releases)
        }, failure: { (error) in
            completion([])
        })
    }
}

extension WebArtistService {
    private struct WebArtistsResponse: Decodable {
        let artists: [Artist]
    }
    
    private struct WebAlbumsResponse: Decodable {
        let releases: [Album]
    }
}


