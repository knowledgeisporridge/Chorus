//
//  WebLyricsService.swift
//  Chorus
//
//  Created by Dan Wartnaby on 01/10/2019.
//  Copyright © 2019 Dan Wartnaby. All rights reserved.
//

import UIKit

class WebLyricsService: LyricsService {
    private let endpoint = "https://api.lyrics.ovh/v1/"
        
    func fetchLyrics(for artist: Artist, track: Track, completion: @escaping (Lyrics?) -> ()) {
        guard let title = track.title else {
            completion(nil); return
        }
        
        invoke(endpoint: "\(endpoint)\(artist.name.escaped())/\(title.escaped())", success: { (data, response) in
            guard let data = data,
                  let lyricsResponse = try? JSONDecoder().decode(WebLyricsResponse.self, from: data) else {
                completion(nil); return
            }
            
            completion(lyricsResponse.lyrics)
        }, failure: { (error) in
            completion(nil)
        })
    }
}

extension WebLyricsService {
    private struct WebLyricsResponse: Decodable {
        let lyrics: Lyrics
    }
}
