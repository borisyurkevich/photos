//
//  MetadataViewController.swift
//  SOLID Photo Gallery
//
//  Created by Boris Yurkevich on 30/08/2017.
//  Copyright © 2017 Boris Yurkevich. All rights reserved.
//

import UIKit

final class MetadataViewController: UIViewController {

    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var dateTakenLabel: UILabel!
    @IBOutlet weak var dateAddedLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var tagsLabel: UILabel!
    
    var photo: FlickrDataModel.Photo?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let safePhoto = photo {
            title = safePhoto.title
            authorLabel.text = safePhoto.author
            dateTakenLabel.text = safePhoto.dataTaken
            dateAddedLabel.text = safePhoto.published
            descriptionLabel.text = safePhoto.description
            tagsLabel.text = safePhoto.tags
        }
    }

}
