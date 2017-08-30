//
//  NetworkService+URLSession.swift
//  SOLID Photo Gallery
//
//  Created by Boris Yurkevich on 29/08/2017.
//  Copyright © 2017 Boris Yurkevich. All rights reserved.
//

import Foundation

extension NetworkService {
    
    /// Performs GET request.
    /// Returns data object.
    func request(url: URL?, completion: @escaping (_ success: Bool, _ error: Error?, _ data: Data?) -> ()) {
        guard let safeURL = url else {
            print("⚠️ Missing URL!")
            completion(false, nil, nil)
            return
        }

        var request = URLRequest(url: safeURL, cachePolicy: .returnCacheDataElseLoad)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        let session = URLSession(configuration: .default)
        
        session.dataTask(with: request) { (data, response, error) in
            completion(error == nil, error, data)
        }.resume()
    }
}
