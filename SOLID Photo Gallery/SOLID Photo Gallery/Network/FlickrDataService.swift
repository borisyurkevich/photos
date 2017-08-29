//
//  DataService.swift
//  SOLID Photo Gallery
//
//  Created by Boris Yurkevich on 29/08/2017.
//  Copyright © 2017 Boris Yurkevich. All rights reserved.
//

import Foundation

struct FlickrDataService {
    
    enum DataType: String {
        case json
    }
    
    let url: URL?
    
    init(path: String, dataType: DataType) {
       url = URL(string: "\(path)?format=\(dataType)&nojsoncallback=1")
    }
}

