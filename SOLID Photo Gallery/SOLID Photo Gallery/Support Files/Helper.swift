//
//  Helper.swift
//  SOLID Photo Gallery
//
//  Created by Boris Yurkevich on 30/08/2017.
//  Copyright © 2017 Boris Yurkevich. All rights reserved.
//

import UIKit

struct Helper {
    
    static func load(viewController: StoryboardName) -> UIViewController? {
        let storyboard = UIStoryboard(name: viewController.rawValue, bundle: nil)
        
        guard let controller = storyboard.instantiateInitialViewController() else {
            fatalError("Failed to load storyboard for \(viewController)")
        }
        return controller
    }
    
    enum StoryboardName: String {
        case photo = "Photo"
    }
}
