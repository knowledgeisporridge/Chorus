//
//  String+Escaped.swift
//  Chorus
//
//  Created by Dan Wartnaby on 01/10/2019.
//  Copyright © 2019 Dan Wartnaby. All rights reserved.
//

import UIKit

extension String {
    func escaped(_ allowedCharacters: CharacterSet = .urlHostAllowed) -> String {
        return self.addingPercentEncoding(withAllowedCharacters: allowedCharacters)!
    }
}
