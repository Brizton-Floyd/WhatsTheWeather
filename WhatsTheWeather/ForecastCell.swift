//
//  ForecastCell.swift
//  WhatsTheWeather
//
//  Created by brizton floyd on 10/12/16.
//  Copyright © 2016 brizton floyd. All rights reserved.
//

import UIKit

class ForecastCell : BaseCell {

    let weaterIconImage: UIImageView = {
       let weatherImage = UIImageView()
        //weatherImage.backgroundColor = UIColor.green
        weatherImage.image = UIImage(named: "Clear")
        weatherImage.contentMode = .scaleAspectFill
        weatherImage.clipsToBounds = true
        return weatherImage
    }()
        
    let tempLabel: UILabel = {
        let label = UILabel()
        label.text = "83°F"
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 22)
        label.textAlignment = .left
       // label.backgroundColor = UIColor.purple
        return label
    }()
    
    let weatherCategoryLabel: UILabel = {
        let label = UILabel()
        label.text = "Sunny"
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 22)
        label.textAlignment = .right
        
        return label
    }()
    
    let currentDayLabel: UILabel = {
        let label = UILabel()
        label.text = "Friday"
        label.textColor = UIColor.white
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textAlignment = .left

        return label
    }()
    
    override func setUpViews() {
        super.setUpViews()
        
       // addSubview(cellBackgroundImage)
        addSubview(weaterIconImage)
        addSubview(tempLabel)
        addSubview(weatherCategoryLabel)
        addSubview(currentDayLabel)
        
       // let margin = frame.width / 2.7
      //  addContraints(formatString: "H:[v0]", view: cellBackgroundImage)
        //addContraints(formatString: "V:[v0]", view: cellBackgroundImage)
        
        addContraints(formatString: "H:[v0(100)]", view: weaterIconImage)
        addContraints(formatString: "V:[v0(100)]", view: weaterIconImage)
        
        addConstraint(NSLayoutConstraint(item: weaterIconImage, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: weaterIconImage, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0))

        addContraints(formatString: "H:|-12-[v0]-8-[v1]", view:tempLabel,weaterIconImage)
        addContraints(formatString: "V:|[v0(20)]-4-[v1]-20-|", view: currentDayLabel, tempLabel)
        
        addContraints(formatString: "H:|-12-[v0]-8-[v1]", view:currentDayLabel,weaterIconImage)
        
        addContraints(formatString: "H:[v0]-8-[v1]-12-|", view: weaterIconImage,weatherCategoryLabel)
        addContraints(formatString: "V:|-20-[v0]-20-|", view: weatherCategoryLabel)
        
        //backgroundColor = UIColor.blue
        
    }
}
