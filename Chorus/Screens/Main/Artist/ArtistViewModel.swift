//
//  ArtistViewModel.swift
//  Chorus
//
//  Created by Dan Wartnaby on 01/10/2019.
//  Copyright © 2019 Dan Wartnaby. All rights reserved.
//

import UIKit

class ArtistViewModel {
    
    var artist: Artist?
    var albums: [Album]?
    var artistRepository: ArtistRepository
    var lyricsRepository: LyricsRepository
    
    init(artistRepository: ArtistRepository, lyricsRepository: LyricsRepository) {
        self.artistRepository = artistRepository
        self.lyricsRepository = lyricsRepository
    }
    
    func allMedia(_ mediaType: AlbumMedia.Format = .CD) -> [AlbumMedia] {
        return Array((albums ?? []).compactMap( { $0.media } ).joined())
    }
    
    func allTracks(on mediaType: AlbumMedia.Format = .CD) -> [Track] {
        return Array(allMedia(mediaType).compactMap( { $0.tracks } ).joined())
    }
    
    func fetchTrack(withId id: String, on mediaType: AlbumMedia.Format = .CD) -> Track? {
        return allTracks().first(where: { $0.id == id })
    }
    
    func statistics() -> String {
        return "\(String(allTracks().count)) Tracks. \(String(allMedia().count)) Releases."
    }
    
    func findArtist(named name: String, completion: @escaping () -> ()) {
        artistRepository.findArtist(named: name) { potentialArtist in
            self.artist = potentialArtist
            
            guard let artist = self.artist else {
                return
            }
            
            self.artistRepository.fetchAlbums(forArtist: artist) { albums in
                self.albums = albums
                
                completion()
            }
        }
    }
    
    func tableViewCellViewModels() -> [TableViewCellViewModel] {
        var viewModels:[TableViewCellViewModel] = []
        
        albums?.forEach( { album in
            guard let albumViewModel = AlbumCoverTableViewCellViewModel(album: album) else {
                return
            }
            viewModels.append(albumViewModel)
            
            album.media?.forEach({ media in
                media.tracks?.forEach({ track in
                    guard let trackViewModel = TrackTableViewCellViewModel(track: track) else {
                        return
                    }
                    
                    viewModels.append(trackViewModel)
                })
            })
        })
        
        return viewModels
    }
}


extension ArtistViewModel {
    func countLyrics(progress: @escaping (Int) -> ()) {
        guard let artist = artist else {
            progress(0); return
        }
        
        var wordCount = 0
        self.allTracks().forEach({ track in
            lyricsRepository.fetchLyrics(for: artist, track: track) { lyrics in
                if let lyrics = lyrics {
                    wordCount += lyrics.wordCount()
                    progress(wordCount);
                }
            }
        })
    }
}
