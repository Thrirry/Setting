//
//  UIColorExts.swift
//  Setting
//
//  Created by Gone on 12/18/18.
//  Copyright © 2018 Gone. All rights reserved.
//

import UIKit

extension UIColor {
    
    convenience init(rgb: UInt) {
        self.init(
            red: CGFloat((rgb & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgb & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgb & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    struct tableView {
        static let mainBackgroundColor = UIColor(rgb: 0xF7F7F7)
        static let backgroundSection = UIColor(rgb: 0xFAF5DF)
        static let sectionTitle = UIColor(rgb: 0xC9C9C9)
        static let backgroundContent = UIColor(rgb: 0xFAF6DF)
        static let backgroundButton = UIColor(rgb: 0x03546C)
        static let titleButton = UIColor(rgb: 0xFFFBE6)
        static let cancelButton = UIColor(rgb: 0xFD5523)
    }
    
    struct navigatorItem {
        static let buttonColor = UIColor(rgb: 0x02A9BF)
    }

}
