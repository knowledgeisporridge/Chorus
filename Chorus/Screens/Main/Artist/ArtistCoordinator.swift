//
//  ArtistCoordinator.swift
//  Chorus
//
//  Created by Dan Wartnaby on 01/10/2019.
//  Copyright © 2019 Dan Wartnaby. All rights reserved.
//

import UIKit

class ArtistCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    var animated: Bool
    
    init(navigationController: UINavigationController, animated: Bool = true) {
        self.navigationController = navigationController
        self.animated = animated
    }
    
    func start() {
        let viewModel = ArtistViewModel(artistRepository: ArtistRepository(artistService: WebArtistService()),
                                        lyricsRepository: LyricsRepository(lyricsService: WebLyricsService()))
        
        let artistViewController = ArtistViewController.instantiate(from: "Main")
        artistViewController.coordinator = self
        artistViewController.viewModel = viewModel
        
        navigationController.pushViewController(artistViewController, animated: animated)
    }
    
    func showLyrics(artist: Artist, and track: Track) {
        let viewModel = TrackViewModel(artist: artist, track: track, lyricsRepository: LyricsRepository(lyricsService: WebLyricsService()))
        
        let trackViewController = TrackViewController.instantiate(from: "Main")
        trackViewController.viewModel = viewModel
        
        navigationController.pushViewController(trackViewController, animated: animated)
    }
}
