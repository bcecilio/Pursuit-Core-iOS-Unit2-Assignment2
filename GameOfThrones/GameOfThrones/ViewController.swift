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
    
    var episodes = [[GOTEpisode]]()

  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.dataSource = self
  }


}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return episodes[section].count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "episodeCell", for: indexPath) as? GoT_Cell else {
            fatalError("Animal cell could not be queued")
        }
        // get the current object (animal) at the indexPath
        let episode = episodes[indexPath.section][indexPath.row]
        // configure the cell
        cell.configureCell(episode: episode)
        return cell
    }
}

