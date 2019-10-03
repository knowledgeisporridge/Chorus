//
//  Coordinator.swift
//  Chorus
//
//  Created by Dan Wartnaby on 01/10/2019.
//  Copyright © 2019 Dan Wartnaby. All rights reserved.
//

import UIKit

protocol Coordinator {
    var navigationController: UINavigationController { get }
    var animated: Bool { get }
    
    func start()
}

