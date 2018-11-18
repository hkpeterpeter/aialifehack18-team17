//
//  UIView-Extension.swift
//  AIAHack-Test
//
//  Created by Tim Ng on 11/17/18.
//  Copyright © 2018 Tim Ng. All rights reserved.
//

import UIKit

extension UIView {
    
    func addConstraintsWith(format: String, views: UIView...) {
        var viewsDictionary = [String: UIView]()
        for (index, view) in views.enumerated() {
            let key = "v\(index)"
            viewsDictionary[key] = view
            
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: viewsDictionary))
        
    }
    
}

