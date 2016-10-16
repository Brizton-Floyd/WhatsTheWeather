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

extension UIImageView {
    
    func getRequestedImage(image: String) {

        let url = URL(string: image)
        
        
        URLSession.shared.dataTask(with: url!, completionHandler: { (data, response, error) in
            
            if error != nil {
                print(error)
                return
            }
            
            DispatchQueue.main.async(execute: { 
                
                self.image = UIImage(data: data!)
            })
            
            
        }).resume()
    }
}



extension UIColor {
    
    static func setTransParency(redColor: Float, green: Float, blue:Float) -> UIColor {
        
        return UIColor(colorLiteralRed: redColor / 255, green: green/255, blue: blue/255, alpha: 1)
    }
}
