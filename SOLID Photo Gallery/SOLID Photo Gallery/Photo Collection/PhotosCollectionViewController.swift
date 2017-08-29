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
    
    private let photosCollectionService = PhotosCollectionService()
    private var dataSource: FlickrDataModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        requestData()
    }
    
    private func requestData() {
        photosCollectionService.request(url: photosCollectionService.flickr.url) { (success, error, data) in
            if success {
                let decoder = JSONDecoder()
                do {
                    let model = try decoder.decode(FlickrDataModel.self, from: data!)
                    self.dataSource = model
                    DispatchQueue.main.async(execute: {
                        self.collectionView?.reloadData()
                    })
                } catch {
                    print("⚠️ Decoding failed.")
                }
            }
        }
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
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
        
        cell.backgroundColor = .blue
    
        return cell
    }

}
