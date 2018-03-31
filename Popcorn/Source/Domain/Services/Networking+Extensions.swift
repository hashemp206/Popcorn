//
//  Networking+Extensions.swift
//  Popcorn
//
//  Created by Hashem Aboonajmi on 3/29/18.
//  Copyright © 2018 Hashem Aboonajmi. All rights reserved.
//

import Foundation
import Networking

let FNetworking = Networking()

/// Define a convenience initializer with App base url
extension Networking {
    
    public convenience init() {
        self.init(baseURL: App.baseURL.absoluteString)
    }
}
