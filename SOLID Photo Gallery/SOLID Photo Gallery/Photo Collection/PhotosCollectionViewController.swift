//
//  PhotosCollectionViewController.swift
//  SOLID Photo Gallery
//
//  Created by Boris Yurkevich on 28/08/2017.
//  Copyright © 2017 Boris Yurkevich. All rights reserved.
//

import Foundation
import UIKit

private struct ReuseIdentifier {
    static let cell = "Photo Cell Identifier"
    static let header = "Header Identifier"
    static let footer = "Footer Identifier"
}

final class PhotosCollectionViewController: UICollectionViewController {
    
    private let flickrService = FlickrService()
    private var dataSource: FlickrDataModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        requestData()
    }
    
    private func requestData() {
        flickrService.request(url: flickrService.api.url) { (success, error, data) in
            if success {
                if let newModel = self.flickrService.parse(data: data) {
                    self.dataSource = newModel
                    DispatchQueue.main.async(execute: {
                        self.title = newModel.title
                        self.collectionView?.reloadData()
                    })
                }
            }
        }
    }

    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let safaDataSource = dataSource else {
            return 0
        }
        return safaDataSource.items.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ReuseIdentifier.cell, for: indexPath) as UICollectionViewCell
        
        guard let customCell = cell as? PhotoCollectionViewCell  else {
            return cell
        }
        guard let photo = dataSource?.items[indexPath.row] else {
            return cell
        }
        guard let url = URL(string: photo.media.m) else {
            return cell
        }
        
        flickrService.request(url: url) { (success, error, data) in
            if success {
                if let image = UIImage(data: data!) {
                    DispatchQueue.main.async(execute: {
                        customCell.imageView.image = image
                    })
                }
            }
        }
        
        return cell
    }
    
    // MARK: CollectionViewDelegate
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let photo = dataSource?.items[indexPath.row] else {
            return
        }
        guard let cell = collectionView.cellForItem(at: indexPath) as? PhotoCollectionViewCell else {
            return
        }
        let viewer = Helper.load(viewController: .photo) as! PhotoViewController
        viewer.photo = photo
        viewer.imageFile = cell.imageView.image

        navigationController?.pushViewController(viewer, animated: true)
    }

}
