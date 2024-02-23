//
//  Font.swift
//  4hw4
//
//  Created by Telegey Nurbekova on 22/02/24.
//

import UIKit

enum Fonts: String {
    case bold = "Poppins-Bold"
    case light = "Poppins-ExtraLight"
    case regular = "Poppins-Regular"
    
    func size(_ size: CGFloat) -> UIFont {
        if let font = UIFont(name: rawValue, size: size) {
            return font
        } else {
            return UIFont.systemFont(ofSize: size)
        }
    }
}
