//
//  Constants.swift
//  Popcorn
//
//  Created by Hashem Aboonajmi on 3/29/18.
//  Copyright © 2018 Hashem Aboonajmi. All rights reserved.
//

import Foundation
import SwiftyUserDefaults

struct Constants {
    static let ApiKey: String = "2696829a81b1b5827d515ff121700838"
    static let fidilioDomain = "fidilio.com.ios"
}

extension DefaultsKeys {
    static let recentSearches          = DefaultsKey<[String]?>("recentSearches")

}
