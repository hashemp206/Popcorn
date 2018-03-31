//
//  Foundation+Extension.swift
//  Popcorn
//
//  Created by Hashem Aboonajmi on 3/30/18.
//  Copyright © 2018 Hashem Aboonajmi. All rights reserved.
//

import Foundation
import UIKit

extension UIScreen {
    
    class var pixelHeight: CGFloat {
        return 1.0/UIScreen.main.scale
    }
}

extension UIApplication {
    
    public static func openSettings() {
        UIApplication.shared.open(URL(string: UIApplicationOpenSettingsURLString)!, options: [:], completionHandler: nil)
    }
}

extension DateFormatter {
    // we need a date formatter to handle the yyyy-MM-dd format of the releaseDate
    static let yyyyMMdd: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        formatter.calendar = Calendar(identifier: .iso8601)
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        formatter.locale = Locale(identifier: "en_US_POSIX")
        return formatter
    }()
}
