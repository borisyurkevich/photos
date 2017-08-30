//
//  SOLID_Photo_GalleryTests.swift
//  SOLID Photo GalleryTests
//
//  Created by Boris Yurkevich on 28/08/2017.
//  Copyright © 2017 Boris Yurkevich. All rights reserved.
//

import XCTest
@testable import SOLID_Photo_Gallery

class SOLID_Photo_GalleryTests: XCTestCase {
    
    func testFlickrAPI() {
        let flickrService = FlickrService()
        
        let loading = expectation(description: "Accessing FLickr API")
        flickrService.request(url: flickrService.api.url) { (success, error, data) in
            assert(success)
            loading.fulfill()
        }
        waitForExpectations(timeout: 60.0)
    }
    
    func testParser() {
        
        let json = """
{
"title": "Uploads from everyone",
"link": "",
"description": "",
"modified": "2017-08-29T23:18:10Z",
"generator": "",
"items":
[{
"title": "NTPC share-sale is expected to fetch govt Rs. 13,800 crore",
"link": "",
"media":
{
"m": ""
},
"date_taken": "2017-08-29T16:18:10-08:00",
"description": "",
"published": "2017-08-29T23:18:10Z",
"author": "",
"author_id": "",
"tags": "news latest india business entertainment world best sports"
}]
}
""".data(using: .utf8)!
        
        let service = FlickrService()
        let result = service.parse(data: json)
        assert(result != nil)
        assert(result!.items.count > 0)
    }
    
    
}
