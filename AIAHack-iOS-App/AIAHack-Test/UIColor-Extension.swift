//
//  UIColor-Extension.swift
//  AIAHack-Test
//
//  Created by Tim Ng on 11/17/18.
//  Copyright © 2018 Tim Ng. All rights reserved.
//

import UIKit

extension UIColor {
    
    static let Divisor: CGFloat = 255
    
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat = 1) -> UIColor {
        return UIColor(red: red/Divisor, green: green/Divisor, blue: blue/Divisor, alpha: alpha)
    }
    

}
