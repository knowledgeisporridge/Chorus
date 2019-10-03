//
//  LyricsRepository.swift
//  Chorus
//
//  Created by Dan Wartnaby on 01/10/2019.
//  Copyright © 2019 Dan Wartnaby. All rights reserved.
//

import UIKit

class LyricsRepository: NSObject {
    private var lyricsService: LyricsService
    
    init(lyricsService: LyricsService) {
        self.lyricsService = lyricsService
    }
    
    func fetchLyrics(for artist: Artist, track: Track, completion: @escaping (Lyrics?) -> ()) {
        lyricsService.fetchLyrics(for: artist, track: track, completion: completion)
    }
}
