//
//  PhotosCollectionViewController.swift
//  SOLID Photo Gallery
//
//  Created by Boris Yurkevich on 28/08/2017.
//  Copyright © 2017 Boris Yurkevich. All rights reserved.
//

import UIKit

private struct ReuseIdentifier {
    static let cell = "Photo Cell Identifier"
    static let header = "Header Identifier"
    static let footer = "Footer Identifier"
}

final class PhotosCollectionViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }


    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 0
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ReuseIdentifier.cell, for: indexPath)
    
        // Configure the cell
    
        return cell
    }

}
