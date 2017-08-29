//
//  PhotosCollectionService.swift
//  SOLID Photo Gallery
//
//  Created by Boris Yurkevich on 29/08/2017.
//  Copyright © 2017 Boris Yurkevich. All rights reserved.
//

import Foundation

struct FlickrService: NetworkService {
    
    let api = FlickrAPI(path: "http://api.flickr.com/services/feeds/photos_public.gne", dataType: .json)
    // URL from https://www.flickr.com/services/feeds/docs/photos_public
    
    /// Call this method to parse succesful reponose from Flickr API.
    func parse(data: Data?) -> FlickrDataModel? {
        guard let safeData = data else {
            return nil
        }
        
        let decoder = JSONDecoder()
        do {
            let model = try decoder.decode(FlickrDataModel.self, from: safeData)
            return model
        } catch {
            print("⚠️ Decoding failed.")
            return nil
        }
    }
    
}
