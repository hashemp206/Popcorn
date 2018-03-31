//
//  ASDisplayNode+Extensions.swift
//  Popcorn
//
//  Created by Hashem Aboonajmi on 3/31/18.
//  Copyright © 2018 Hashem Aboonajmi. All rights reserved.
//

import Foundation
import AsyncDisplayKit

extension ASDisplayNode
{
    class func LoadingIndicator(activityIndicatorStyle: UIActivityIndicatorViewStyle, color: UIColor = .gray) -> ASDisplayNode {
        let loadingIndicator = ASDisplayNode { () -> UIView in
            let activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: activityIndicatorStyle)
            activityIndicator.color = color
            activityIndicator.startAnimating()
            return activityIndicator
        }
        loadingIndicator.style.preferredSize = CGSize(width: 22, height: 22)
        return loadingIndicator
    }
    
    class func BorderNode() -> ASDisplayNode {
        let node = ASDisplayNode()
        node.backgroundColor = .borderColor
        node.height = UIScreen.pixelHeight
        node.style.height = ASDimensionMake(UIScreen.pixelHeight)
        return node
    }
    
    //  MARK: - Frame Helper
    var x: CGFloat {
        get {
            return frame.minX
        }
        
        set {
            var frame = self.frame
            frame.origin.x = newValue
            self.frame = frame
        }
    }
    
    var y: CGFloat {
        get {
            return frame.minY
        }
        
        set {
            var frame = self.frame
            frame.origin.y = newValue
            self.frame = frame
        }
    }
    
    public var midX: CGFloat {
        get {
            return x + frame.width / 2.0
        }
        set {
            x += (newValue - self.midX)
        }
    }
    
    public var midY: CGFloat {
        get {
            return y + frame.height / 2.0
        }
        set {
            y += (newValue - self.midY)
        }
    }
    
    public var left: CGFloat {
        get {
            return frame.origin.x
        }
        
        set {
            var frame: CGRect = self.frame
            frame.origin.x = newValue
            self.frame = frame
            
        }
    }
    
    public var top: CGFloat {
        get {
            return frame.origin.y
        }
        
        set {
            var frame: CGRect = self.frame
            frame.origin.y = newValue
            self.frame = frame
        }
    }
    
    public var right: CGFloat {
        get {
            return frame.origin.x + frame.size.width
        }
        set {
            var frame: CGRect = self.frame
            frame.origin.x = newValue - frame.size.width
            self.frame = frame
        }
    }
    
    public var bottom: CGFloat {
        get{
            return frame.origin.y + frame.size.height
        }
        
        set{
            var frame: CGRect = self.frame
            frame.origin.y = newValue - frame.size.height
            self.frame = frame
        }
    }
    
    
    public var size: CGSize {
        get {
            return frame.size
        }
        
        set {
            var rect: CGRect = frame
            rect.size = newValue
            frame = rect
            
        }
    }
    
    var width: CGFloat {
        get {
            return frame.size.width
        }
        
        set {
            var frame = self.frame
            frame.size.width = newValue
            self.frame = frame
        }
    }
    
    var height: CGFloat {
        get {
            return frame.size.height
        }
        
        set {
            var frame = self.frame
            frame.size.height = newValue
            self.frame = frame
        }
    }
}
