//
//  DetailViewController.swift
//  GameOfThrones
//
//  Created by Brendon Cecilio on 11/19/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var episodeImage: UIImageView!
    @IBOutlet weak var episodeLabel: UILabel!
    @IBOutlet weak var seasonLabel: UILabel!
    @IBOutlet weak var episodeRuntime: UILabel!
    @IBOutlet weak var airDateLabel: UILabel!
    
    var detailEpisode: GOTEpisode?

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    func updateUI() {
        guard let selectedEpisode = detailEpisode else {
            fatalError("couldn't find episode info")
        }
        navigationItem.title = selectedEpisode.name
        episodeImage.image = UIImage(named: selectedEpisode.originalImageID)
        episodeLabel.text = selectedEpisode.name
        seasonLabel.text = selectedEpisode.season.description
        episodeRuntime.text = selectedEpisode.runtime.description
        airDateLabel.text = selectedEpisode.airdate
    }
}
