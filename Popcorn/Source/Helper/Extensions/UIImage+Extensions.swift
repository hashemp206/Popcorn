//
//  UIImage+Extensions.swift
//  Popcorn
//
//  Created by Hashem Aboonajmi on 3/31/18.
//  Copyright © 2018 Hashem Aboonajmi. All rights reserved.
//

import Foundation
import UIKit

extension UIImage {
    
    func image(withCornerRadius radius: CGFloat) -> UIImage? {
        //create drawing context
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        //clip image
        let path = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: size.width, height: size.height), cornerRadius: radius)
        path.addClip()
        //draw image
        draw(at: CGPoint.zero)
       
        //capture resultant image
        let image: UIImage? = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        //return image
        return image
    }
}

