//
//  PhotosCollectionService.swift
//  SOLID Photo Gallery
//
//  Created by Boris Yurkevich on 29/08/2017.
//  Copyright © 2017 Boris Yurkevich. All rights reserved.
//

import Foundation

struct PhotosCollectionService: NetworkService {
    
    let flickr = FlickrDataService(path: "http://api.flickr.com/services/feeds/photos_public.gne", dataType: .json)
    // URL from https://www.flickr.com/services/feeds/docs/photos_public
    
}
