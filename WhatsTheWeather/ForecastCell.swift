//
//  ForecastCell.swift
//  WhatsTheWeather
//
//  Created by brizton floyd on 10/12/16.
//  Copyright © 2016 brizton floyd. All rights reserved.
//

import UIKit

class ForecastCell : BaseCell {

    var forecastDetails: Forecast? {
      
        didSet {
            setIconImage()
            if let dayLabel = forecastDetails?.dayOfWeek {
                currentDayLabel.text = dayLabel
            }
            if let temp = forecastDetails?.highTemp {
                tempLabel.text = "\(Int(temp))°F"
            }
            
            if let condition = forecastDetails?.condition {
                weatherCategoryLabel.text = condition
            }
            
            if let low = forecastDetails?.lowTemp {
                lowTemp.text = "\(Int(low))°F"
            }
        }
    }
    
    func setIconImage() {
        if let url = forecastDetails?.imageIcon {
            weaterIconImage.image = UIImage(named: url)
        }
    }
    
    let weaterIconImage: UIImageView = {
       let weatherImage = UIImageView()
        //weatherImage.backgroundColor = UIColor.green
        weatherImage.image = UIImage(named: "Clear")
        weatherImage.contentMode = .scaleAspectFit
        weatherImage.clipsToBounds = true
        return weatherImage
    }()
        
    let tempLabel: UILabel = {
        let label = UILabel()
        label.text = "--"
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 18)
        label.textAlignment = .left
       // label.backgroundColor = UIColor.purple
        return label
    }()
    
    let lowTemp: UILabel = {
        let label = UILabel()
        label.text = "--"
        label.textColor = UIColor.lightGray
        label.font = UIFont.systemFont(ofSize: 18)
        label.textAlignment = .left
        //label.backgroundColor = UIColor.purple
        return label
    }()
    
    let weatherCategoryLabel: UILabel = {
        let label = UILabel()
        label.text = "--"
        
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 14)
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
    
    let divider: UIView = {
       
        let view = UIView()
        view.backgroundColor = UIColor.setTransParency(redColor: 220, green: 220, blue: 220)
        return view
    }()
    
    override func setUpViews() {
        super.setUpViews()
        
        addSubview(weaterIconImage)
        addSubview(tempLabel)
        addSubview(weatherCategoryLabel)
        addSubview(currentDayLabel)
        addSubview(lowTemp)
        addSubview(divider)
        
        addContraints(formatString: "H:[v0(100)]", view: weaterIconImage)
        addContraints(formatString: "V:[v0(100)]", view: weaterIconImage)
          addContraints(formatString: "V:[v0]", view: lowTemp)
        
        addConstraint(NSLayoutConstraint(item: lowTemp, attribute: .top, relatedBy: .equal, toItem:
            tempLabel, attribute: .bottom, multiplier: 1, constant: 0))
        
        addConstraint(NSLayoutConstraint(item: weaterIconImage, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: weaterIconImage, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0))
        
        addConstraint(NSLayoutConstraint(item: divider, attribute: .top, relatedBy: .equal, toItem: weaterIconImage, attribute: .bottom, multiplier: 1, constant: 12))
        addConstraint(NSLayoutConstraint(item: divider, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 1))
        
        addContraints(formatString:"H:|[v0]|", view: divider)
        
        addContraints(formatString: "H:|-12-[v0]-8-[v1]", view:tempLabel,weaterIconImage)
        addContraints(formatString: "H:|-12-[v0]-8-[v1]", view:lowTemp,weaterIconImage)
        addContraints(formatString: "V:|[v0(20)][v1][v2(20)]|", view: currentDayLabel, tempLabel,lowTemp)
        
        addContraints(formatString: "H:|-12-[v0]-8-[v1]", view:currentDayLabel,weaterIconImage)
        
        addContraints(formatString: "H:[v0]-8-[v1]-12-|", view: weaterIconImage,weatherCategoryLabel)
        addContraints(formatString: "V:|-20-[v0]-20-|", view: weatherCategoryLabel)
        
    }
}
