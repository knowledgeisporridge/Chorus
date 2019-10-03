//
//  LyricsService.swift
//  Chorus
//
//  Created by Dan Wartnaby on 01/10/2019.
//  Copyright © 2019 Dan Wartnaby. All rights reserved.
//

import UIKit

protocol LyricsService: Service {
    func fetchLyrics(for artist: Artist, track: Track, completion: @escaping (Lyrics?) -> ())
}
