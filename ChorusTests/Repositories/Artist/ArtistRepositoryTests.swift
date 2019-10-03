//
//  ArtistRepositoryTests.swift
//  ChorusTests
//
//  Created by Dan Wartnaby on 01/10/2019.
//  Copyright © 2019 Dan Wartnaby. All rights reserved.
//

import XCTest
@testable import Chorus


class MockArtistService: ArtistService {
    func findArtist(named name: String, completion: @escaping (Artist?) -> ()) {
        completion(Artist(name: name))
    }
}


class ArtistRepositoryTests: XCTestCase {
    
    var artistRepository: ArtistRepository!

    override func setUp() {
        artistRepository = ArtistRepository(artistService: MockArtistService())
    }

    func testFindArtist() {
        artistRepository.findArtist(named: "Radiohead" ) { potentialArtist in
            
            guard let artist = potentialArtist else {
                XCTFail("Radiohead not found... but they do exist. They're great.")
                return
            }
            
             XCTAssertNotNil(artist.name)
        }
    }

    func testFindArtistPerformance() {
        self.measure {
            artistRepository.findArtist(named: "Radiohead" ) { potentialArtist in
                XCTAssertNotNil(potentialArtist)
                XCTAssertNotNil(potentialArtist?.name)
            }
        }
    }
}
