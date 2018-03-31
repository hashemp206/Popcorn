//
//  ColorPalette.swift
//  Popcorn
//
//  Created by Hashem Aboonajmi on 3/30/18.
//  Copyright © 2018 Hashem Aboonajmi. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    
    class var backgroundColor: UIColor {
        return UIColor.white
    }
    
    class var textDark: UIColor {
        return UIColor(red: 51/255.0, green: 51/255.0, blue: 51/255.0, alpha: 1)
    }
    
    class var mainColor: UIColor {
        return UIColor(red: 189/255.0, green: 25/255.0, blue: 24/255.0, alpha: 1)
    }
    
    class var borderColor: UIColor {
        return UIColor(red: 218/255.0, green: 218/255.0, blue: 218/255.0, alpha: 1)
    }
}
