//
//  PosterNode.swift
//  Popcorn
//
//  Created by Hashem Aboonajmi on 3/30/18.
//  Copyright © 2018 Hashem Aboonajmi. All rights reserved.
//

import UIKit
import Async

class PosterNode: HANetworkImageNode {

    required init(url: URL?) {
        super.init(url: url)
    
        let cornerRadius: CGFloat = 5
        self.cornerRadius = cornerRadius
        
        // by using imageModificationBlock you we can modify image
        // here we round corners of image
        imageModificationBlock = {
            $0.image(withCornerRadius: cornerRadius)
        }
        
        backgroundColor = .borderColor

        // set shadow
        shadowColor = UIColor.borderColor.cgColor
        shadowOffset = CGSize(width: 0, height: 4)
        shadowOpacity = 1
        shadowRadius = 7
        
        // if clipToBounds is enabled, shodow will clipped
        clipsToBounds = false
    }
}
