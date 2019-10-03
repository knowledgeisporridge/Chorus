//
//  TrackViewController.swift
//  Chorus
//
//  Created by Dan Wartnaby on 01/10/2019.
//  Copyright © 2019 Dan Wartnaby. All rights reserved.
//

import UIKit

class TrackViewController: UIViewController, StoryboardViewController {
    
    var viewModel: TrackViewModel?
    
    @IBOutlet var trackTitleLabel: UILabel?
    @IBOutlet var statisticsLabel: UILabel?
    @IBOutlet var lyricsLabel: UILabel?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        trackTitleLabel?.text = viewModel?.track.title ?? "untitled".localized()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        fetchLyrics()
    }
    
    private func fetchLyrics() {
        if let viewModel = viewModel {
            viewModel.fetchLyrics() { lyrics in
                DispatchQueue.main.async { [weak self] in
                    guard let lyrics = lyrics else {
                        self?.lyricsLabel?.text = "error_no_lyrics_found".localized()
                        return
                    }
                    
                    self?.lyricsLabel?.text = lyrics.rawValue
                    self?.lyricsLabel?.sizeToFit()
                    
                    self?.statisticsLabel?.text = "\(lyrics.sentenceCount()) sentences, \(lyrics.wordCount()) words."
                }
            }
        }
    }
}
