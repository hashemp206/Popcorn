import Foundation
import UIKit

extension UIView {
    
    public var position: CGPoint {
        get {
            return frame.origin
        }
        
        set {
            var rect: CGRect = frame
            rect.origin = newValue
            frame = rect
        }
    }
    
    public var x: CGFloat {
        get {
            return frame.origin.x
            
        }
        set {
            var rect: CGRect = frame
            rect.origin.x = newValue
            frame = rect
        }
    }
    
    public var y: CGFloat {
        get {
            return frame.origin.y
        }
        set {
            var rect: CGRect = frame
            rect.origin.y = newValue
            frame = rect
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
    
    // MARK: Size
    
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
    
    public var width: CGFloat {
        get {
            return frame.size.width
        }
        
        set {
            var rect: CGRect = frame
            rect.size.width = newValue
            frame = rect
        }
    }
    
    public var height: CGFloat {
        get {
            return frame.size.height
        }
        
        set {
            var rect: CGRect = frame
            rect.size.height = newValue
            frame = rect
        }
    }

}
