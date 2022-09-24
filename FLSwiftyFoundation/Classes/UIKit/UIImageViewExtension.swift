//
//  UIImageExtension.swift
//  FLSwiftyFoundation
//
//  Created by Feliks Lv on 2022/9/24.
//

import UIKit
import Kingfisher

public extension UIImageView {
    
}

public extension FLExtension where Base == UIImageView {
    func setImageURL(_ url: String) {
        value.kf.setImage(with: URL(string: url))
    }

    func setImage(with url: String, size: CGSize) {
        let processor = DownsamplingImageProcessor(size: size)
        value.kf.setImage(with: URL(string: url), options: [.processor(processor), .cacheOriginalImage])
    }
}
