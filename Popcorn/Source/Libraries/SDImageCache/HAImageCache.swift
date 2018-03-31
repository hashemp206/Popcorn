//
//  HAImageCache.swift
//  FoodIran
//
//  Created by Hashem on 2/1/17.
//  Copyright © 2017 SystemGroup. All rights reserved.
//

import AsyncDisplayKit

class HAImageCache: SDImageCache {
    
    static let sharedInstance: HAImageCache = {
        let instance = HAImageCache()
        
        instance.config.maxCacheAge = 30 * 60  // half hour
        
        return instance
    }()
}

extension HAImageCache: ASImageCacheProtocol, ASNetworkImageNodeDelegate, ASMultiplexImageNodeDelegate {
    
    // MARK: - ASImageCacheProtocol
    func cachedImage(with URL: URL, callbackQueue: DispatchQueue, completion: @escaping AsyncDisplayKit.ASImageCacherCompletion) {
        
        queryCacheOperation(forKey: URL.absoluteString) { (image: UIImage?, _, _) in
            completion(image)
        }
    }
    
    
    // MARK: - ASNetworkImageNodeDelegate Methods
    func imageNode(_ imageNode: ASNetworkImageNode, didLoad image: UIImage) {
        
        store(image, forKey: imageNode.url!.absoluteString, completion: nil)
    }
    
}
