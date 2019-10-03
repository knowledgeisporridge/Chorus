//
//  AlbumCoverTableViewCell.swift
//  Chorus
//
//  Created by Dan Wartnaby on 02/10/2019.
//  Copyright © 2019 Dan Wartnaby. All rights reserved.
//

import UIKit

class AlbumCoverTableViewCell: UITableViewCell {
    @IBOutlet var titleLabel: UILabel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(with viewModel: AlbumCoverTableViewCellViewModel) {
        titleLabel?.text = viewModel.title
    }
}
