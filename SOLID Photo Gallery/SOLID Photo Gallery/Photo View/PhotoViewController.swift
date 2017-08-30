//
//  PhotoViewController.swift
//  SOLID Photo Gallery
//
//  Created by Boris Yurkevich on 30/08/2017.
//  Copyright © 2017 Boris Yurkevich. All rights reserved.
//

import UIKit
import SafariServices

final class PhotoViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func tapShare(_ sender: Any) {
        actionShare()
    }
    @IBAction func tapSafari(_ sender: Any) {
        actionOpenSafari()
    }
    
    var photo: FlickrDataModel.Photo?
    var imageFile: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let safePhoto = photo {
            title = safePhoto.title
        }
        if let safeImageFile = imageFile {
            imageView.image = safeImageFile
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isToolbarHidden = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.isToolbarHidden = true
    }
    
    private func actionOpenSafari() {
        guard let path = photo?.link else {
            // Handle error.
            return
        }
        guard let url = URL(string: path) else {
            // Handle error.
            return
        }
        let safari = SFSafariViewController(url: url)
        present(safari, animated: true, completion: nil)
    }
    
    private func actionShare() {
        guard let image = imageView.image else {
            // Handle error.
            return
        }
        let shareController = UIActivityViewController(activityItems: [image], applicationActivities: nil)
        present(shareController, animated: true, completion: nil)
    }

}
