//
//  RootCoordinator.swift
//  Chorus
//
//  Created by Dan Wartnaby on 01/10/2019.
//  Copyright © 2019 Dan Wartnaby. All rights reserved.
//

import UIKit

class RootCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    var animated: Bool
    
    var artistCoordinator: ArtistCoordinator?
    
    init(launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil, animated: Bool = true) {
        self.navigationController = UINavigationController()
        self.animated = animated
    }
    
    func start() {
        artistCoordinator = ArtistCoordinator(navigationController: navigationController, animated: animated)
        guard let artistCoordinator = artistCoordinator else {
            fatalError("Unable to instantiate find artist view controller...")
        }
        
        artistCoordinator.start()
    }
}
