//
//  TrackTableViewCell.swift
//  Chorus
//
//  Created by Dan Wartnaby on 01/10/2019.
//  Copyright © 2019 Dan Wartnaby. All rights reserved.
//

import UIKit

class TrackTableViewCell: UITableViewCell {
    @IBOutlet var titleLabel: UILabel?

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(with viewModel: TrackTableViewCellViewModel) {
        titleLabel?.text = viewModel.title
    }
}
