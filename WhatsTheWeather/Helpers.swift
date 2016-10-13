//
//  Helpers.swift
//  WhatsTheWeather
//
//  Created by brizton floyd on 10/12/16.
//  Copyright © 2016 brizton floyd. All rights reserved.
//

import UIKit

extension UIView {
    
    func addContraints(formatString: String, view: UIView...) {
        var viewDictinary = [String:UIView]()
        
        for (index, value) in view.enumerated() {
            let key = "v\(index)"
            value.translatesAutoresizingMaskIntoConstraints = false
            viewDictinary[key] = value
        }
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: formatString, options: NSLayoutFormatOptions(), metrics: nil, views: viewDictinary))
    }
}
