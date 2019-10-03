//
//  ArtistViewController.swift
//  Chorus
//
//  Created by Dan Wartnaby on 01/10/2019.
//  Copyright © 2019 Dan Wartnaby. All rights reserved.
//

import UIKit


class ArtistViewController: UIViewController, StoryboardViewController {

    var coordinator: ArtistCoordinator?
    var viewModel: ArtistViewModel?
    
    @IBOutlet var tableView: UITableView?
    @IBOutlet var artistName: UISearchBar?
    @IBOutlet var statisticsLabel: UILabel?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = Bundle.main.infoDictionary?["CFBundleName"] as? String
    }

    override func viewDidAppear(_ animated: Bool) {
        artistName?.becomeFirstResponder()
    }
    
    func updateInterface() {
        tableView?.reloadData()
    }
    
    func updateWordCount(count: Int = 0) {
        statisticsLabel?.text = "\(count) Words. \(viewModel?.statistics() ?? "0 Tracks. 0 Releases.")"
    }
}


extension ArtistViewController: UISearchBarDelegate{
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let artistName = searchBar.searchTextField.text else {
            return
        }
        
        searchBar.searchTextField.resignFirstResponder()
        
        viewModel?.findArtist(named: artistName) {
            DispatchQueue.main.async { [weak self] in
                self?.updateInterface()
            }
            
            self.viewModel?.countLyrics() { count in
                DispatchQueue.main.async { [weak self] in
                    self?.updateWordCount(count: count)
                }
            }
        }
    }
}


extension ArtistViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.tableViewCellViewModels().count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let viewModel = viewModel else { fatalError("No ViewModel set") }
        
        let tableViewCellViewModel = viewModel.tableViewCellViewModels()[indexPath.row]
        
        switch tableViewCellViewModel.self {
        case is AlbumCoverTableViewCellViewModel:
            let cell = tableView.dequeueReusableCell(withIdentifier: tableViewCellViewModel.reuseIdentifier) as! AlbumCoverTableViewCell
            cell.configure(with: tableViewCellViewModel as! AlbumCoverTableViewCellViewModel)
            return cell
        case is TrackTableViewCellViewModel:
            let cell = tableView.dequeueReusableCell(withIdentifier: tableViewCellViewModel.reuseIdentifier) as! TrackTableViewCell
            cell.configure(with: tableViewCellViewModel as! TrackTableViewCellViewModel)
            return cell
        default:
            fatalError("Unknown cell")
        }
    }
}


extension ArtistViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let viewModel = viewModel, let artist = viewModel.artist else {
            fatalError("No ViewModel set")
        }
        
        if let trackTableViewCellViewModel = viewModel.tableViewCellViewModels()[indexPath.row] as? TrackTableViewCellViewModel {
            guard let track = viewModel.fetchTrack(withId: trackTableViewCellViewModel.id) else {
                return
            }
            
            coordinator?.showLyrics(artist: artist, and: track)
        }
    }
}
