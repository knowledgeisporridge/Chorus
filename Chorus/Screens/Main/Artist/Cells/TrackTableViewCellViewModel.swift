//
//  TrackTableViewCellViewModel.swift
//  Chorus
//
//  Created by Dan Wartnaby on 01/10/2019.
//  Copyright © 2019 Dan Wartnaby. All rights reserved.
//

import UIKit

class TrackTableViewCellViewModel: TableViewCellViewModel {
    var reuseIdentifier: String = "Track"

    var id: String
    var title: String
    
    init?(track: Track) {
        guard let title = track.title, let id = track.id else {
            return nil
        }
        self.id = id
        self.title = title
    }
}
