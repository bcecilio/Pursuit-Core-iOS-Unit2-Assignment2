//
//  GoT_Cell.swift
//  GameOfThrones
//
//  Created by Brendon Cecilio on 11/19/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class GoT_Cell: UITableViewCell {

    @IBOutlet weak var episodeImageView: UIImageView!
    @IBOutlet weak var episodeNameLabel: UILabel!
    @IBOutlet weak var episodeLabel: UILabel!
    
    func configureCell(episode: GOTEpisode) {
        episodeImageView.image = UIImage(named: episode.mediumImageID)
        episodeNameLabel.text = episode.name
        episodeLabel.text = episode.number.description
    }
}
