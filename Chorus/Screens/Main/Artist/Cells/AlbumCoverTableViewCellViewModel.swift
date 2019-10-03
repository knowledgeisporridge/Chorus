//
//  AlbumCoverTableViewCellViewModel.swift
//  Chorus
//
//  Created by Dan Wartnaby on 01/10/2019.
//  Copyright © 2019 Dan Wartnaby. All rights reserved.
//

import UIKit

class AlbumCoverTableViewCellViewModel: TableViewCellViewModel {
    var reuseIdentifier: String = "AlbumCover"
    
    var title: String
    
    init?(album: Album) {
        guard let title = album.title else {
            return nil
        }
        self.title = title
    }
}
