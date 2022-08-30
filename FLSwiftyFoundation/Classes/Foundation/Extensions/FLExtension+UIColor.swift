//
//  FLExtension+UIColor.swift
//  FLSwiftyFoundation
//
//  Created by FeliksLv on 2022/8/30.
//

import UIKit

public extension UIColor {
    
    /// r: 0~255
    /// g: 0~255
    /// b: 0~255
    /// a: 0~100 default to 100
    convenience init(r: Int, g: Int, b: Int, a: Int = 100) {
        self.init(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: CGFloat(a) / 100)
    }
    
    static func darkModeColor(_ light: UIColor, _ dark: UIColor) -> UIColor {
        if #available(iOS 13.0, *) {
            return UIColor(dynamicProvider: {
                traitCollection in
                if traitCollection.userInterfaceStyle == .light {
                    return light
                } else {
                    return dark
                }
            })
        } else {
            return light
        }
    }
    
    var ex: FLExtension<UIColor> { FLExtension(self) }
    
}

public extension FLExtension where Base == UIColor {
    static var random: UIColor {
        let red = Int.random(in: 0...255)
        let green = Int.random(in: 0...255)
        let blue = Int.random(in: 0...255)
        return UIColor(r: red, g: green, b: blue)
    }
}
