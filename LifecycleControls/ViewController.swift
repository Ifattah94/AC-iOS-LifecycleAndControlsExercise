//
//  ViewController.swift
//  LifecycleControls
//
//  Created by C4Q  on 11/7/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate {
    
    var songs = [Song]()
    
    @IBOutlet weak var songTableView: UITableView!
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.songTableView.reloadData()
    }
    
    
    var searchWord: String? {
        didSet {
            self.songTableView.reloadData()
        }
    }
    
    var filteredSongArr: [Song] {
        guard let searchWord = searchWord else {
            return songs
        }
        return songs.filter({$0.name.lowercased().contains(searchWord.lowercased())})
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            self.searchWord = nil
        } else {
            self.searchWord = searchText
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard searchBar.text != "" else {
            return
        }
        self.searchWord = searchBar.text
        searchBar.resignFirstResponder()
    }
    
    func loadData() {
        songs = Song.loveSongs
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return min(filteredSongArr.count, Settings.rowNum)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let song = filteredSongArr[indexPath.row]
        let songCell = songTableView.dequeueReusableCell(withIdentifier: "Song Cell", for: indexPath)
        switch Settings.capitalization {
        case .lower :
            songCell.textLabel?.text = song.name.lowercased()
            songCell.detailTextLabel?.text = song.artist.lowercased()
        case .upper :
            songCell.textLabel?.text = song.name.uppercased()
            songCell.detailTextLabel?.text = song.artist.uppercased()
        case .proper :
            songCell.textLabel?.text = song.name
            songCell.detailTextLabel?.text = song.artist
        }
        songCell.backgroundColor = UIColor(displayP3Red: Settings.color.red, green: Settings.color.green, blue: Settings.color.blue, alpha: 1.0)
        if Settings.shouldAlternate && indexPath.row % 2 == 0 {
            songCell.backgroundColor = UIColor(displayP3Red: 1 - Settings.color.red, green: 1 - Settings.color.green, blue: 1 - Settings.color.blue, alpha: 1.0)
        }
        
        return songCell
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.songTableView.delegate = self
        self.songTableView.dataSource = self
        self.searchBar.delegate = self
        loadData()
        
    }
    
}

