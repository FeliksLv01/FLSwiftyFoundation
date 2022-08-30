//
//  synchronized.swift
//  FLSwiftyFoundation
//
//  Created by Feliks Lv on 2022/8/29.
//

import Foundation

public func synchronized(_ lock: Any, block: () -> ()) {
    objc_sync_enter(lock)
    block()
    objc_sync_exit(lock)
}
