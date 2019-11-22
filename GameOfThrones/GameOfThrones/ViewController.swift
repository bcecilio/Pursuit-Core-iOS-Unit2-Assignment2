//
//  ViewController.swift
//  GameOfThrones
//
//  Created by Alex Paul on 11/16/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var episodes = [[GOTEpisode]]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        loadData()
    }
    
    func loadData() {
        episodes = GOTEpisode.getSection()
    }
    
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return episodes[section].count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: GoT_Cell!
        
        if indexPath.section % 2 == 0 {
            guard let episodeCell = tableView.dequeueReusableCell(withIdentifier: "leftCell", for: indexPath) as? GoT_Cell else {
                fatalError("left cell could not be queued")
            }
            cell = episodeCell
        } else {
            guard let episodeCell = tableView.dequeueReusableCell(withIdentifier: "rightCell", for: indexPath) as? GoT_Cell else {
                fatalError("right cell could not be queued")
            }
            cell = episodeCell
        }
        // get the current object (animal) at the indexPath
        let episode = episodes[indexPath.section][indexPath.row]
        // configure the cell
        cell.configureCell(episode: episode)
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return episodes.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return episodes[section].first?.season.description
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}


