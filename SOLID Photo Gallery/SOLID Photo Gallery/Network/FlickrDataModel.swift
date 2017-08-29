//
//  FlickrDataModel.swift
//  SOLID Photo Gallery
//
//  Created by Boris Yurkevich on 29/08/2017.
//  Copyright © 2017 Boris Yurkevich. All rights reserved.
//

import Foundation

struct FlickrDataModel: Decodable {
    let title: String
    let link: String
    let description: String
    let modified: String
    let generator: String
    let items: [Item]
    
    struct Item: Decodable {
        let title: String
        let link: String
        let description: String
        let dataTaken: String
        let published: String
        let author: String
        let authorIdentifier: String
        let tags: String
        
        private enum CodingKeys: String, CodingKey {
            case title
            case link
            case description
            case dataTaken = "date_taken"
            case published
            case author
            case authorIdentifier = "author_id"
            case tags
        }
    }
}
