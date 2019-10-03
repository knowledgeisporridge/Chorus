//
//  TrackViewModel.swift
//  Chorus
//
//  Created by Dan Wartnaby on 01/10/2019.
//  Copyright © 2019 Dan Wartnaby. All rights reserved.
//

import UIKit

class TrackViewModel {
    
    var track: Track
    var artist: Artist
    var lyricsRepository: LyricsRepository
        
    init(artist: Artist, track: Track, lyricsRepository: LyricsRepository) {
        self.track = track
        self.artist = artist
        self.lyricsRepository = lyricsRepository
    }
    
    func title() -> String? {
        return track.title ?? "Unknown"
    }
    
    func fetchLyrics(completion: @escaping (Lyrics?) -> ()) {
        lyricsRepository.fetchLyrics(for: artist, track: track, completion: completion)
    }
}
