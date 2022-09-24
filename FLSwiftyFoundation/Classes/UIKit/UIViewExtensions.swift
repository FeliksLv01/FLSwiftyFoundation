//
//  UIViewExtensions.swift
//  FLSwiftyFoundation
//
//  Created by Feliks Lv on 2022/9/21.
//

import UIKit

public extension UIView {

    var left: CGFloat {
        get {
            self.x
        }
        set {
            self.x = newValue
        }
    }

    var right: CGFloat {
        get {
            CGRectGetMaxX(self.frame)
        }
        set {
            self.x = newValue - self.frame.size.width
        }
    }

    var top: CGFloat {
        get {
            self.y
        }
        set {
            self.y = newValue
        }
    }

    var bottom: CGFloat {
        get {
            CGRectGetMaxY(self.frame)
        }
        set {
            self.y = newValue - self.frame.size.height
        }
    }

    var x: CGFloat {
        get {
            CGRectGetMinX(self.frame)
        }
        set {
            self.frame = CGRect(x: newValue, y: self.frame.origin.y, width: self.frame.size.width, height: self.frame.size.height)
        }
    }

    var y: CGFloat {
        get {
            CGRectGetMinY(self.frame)
        }
        set {
            self.frame = CGRect(x: self.frame.origin.x, y: newValue, width: self.frame.size.width, height: self.frame.size.height)
        }
    }

    var width: CGFloat {
        get {
            CGRectGetWidth(self.frame)
        }
        set {
            self.frame = CGRect(x: x, y: y, width: newValue, height: height)
        }
    }

    var height: CGFloat {
        get {
            CGRectGetHeight(self.frame)
        }
        set {
            self.frame = CGRect(x: x, y: y, width: width, height: newValue)
        }
    }

    var centerX: CGFloat {
        get {
            self.center.x
        }
        set {
            self.center = CGPoint(x: newValue, y: centerY)
        }
    }

    var centerY: CGFloat {
        get {
            self.center.y
        }
        set {
            self.center = CGPoint(x: centerX, y: newValue)
        }
    }

    var origin: CGPoint {
        get {
            self.frame.origin
        }
        set {
            self.frame.origin = newValue
        }
    }

    var size: CGSize {
        get {
            self.frame.size
        }
        set {
            self.frame = CGRect(x: x, y: y, width: newValue.width, height: newValue.height)
        }
    }


    // MARK: Layout Method
    
}

