//
//  FLExtension+UIView.swift
//  FLSwiftyFoundation
//
//  Created by FeliksLv on 2022/8/30.
//

import Foundation

public extension UIView {
    var ex: FLExtension<UIView> { FLExtension(self) }
}

public extension FLExtension where Base == UIView {
    var parentViewController: UIViewController? {
        var parentResponder: UIResponder? = value
        while parentResponder != nil {
            parentResponder = parentResponder!.next
            if let viewController = parentResponder as? UIViewController {
                return viewController
            }
        }
        return nil
    }
    
    var parentNavigationController: UINavigationController? {
        let currentViewController = parentViewController
        if let navigationController = currentViewController as? UINavigationController {
            return navigationController
        }
        return currentViewController?.navigationController
    }
}
