//
//  WeatherSummaryView.swift
//  WhatsTheWeather
//
//  Created by brizton floyd on 10/12/16.
//  Copyright © 2016 brizton floyd. All rights reserved.
//

import UIKit

class WeatherSummaryView : UIView {
    
    var summaryData: CurrentWeather? {
        
        didSet {
            
            fetchWeatherImage()
            if let city = summaryData?.city, let state = summaryData?.state {
                
                let text = "\(city), \(state)"
                locationLabel.text = text
            }
            
            if let windspeed = summaryData?.windSpeed {
                
                windSpeedLabel.text = "\(windspeed)mph"
            }
            if let temp = summaryData?.temperature {
                let roundedTemp = Int(temp)
                mainTempLabel.text = "\(roundedTemp)°F"
            }
            if let precip = summaryData?.liquidPercip {
                percipChanceLabel.text = "\(precip)"
            }
            if let day = summaryData?.day, let weekday = summaryData?.weekday, let month = summaryData?.month {
                
                dateLabel.text = "\(weekday), \(month) \(day)"
            }
            
            if let summary = summaryData?.weatherSummary {
                weatherQuickTip.text = summary
            }
        }
    }

    func fetchWeatherImage() {
        
        if let iconUrl = summaryData?.iconImage {
            
            weatherImage.image = UIImage(named: iconUrl)
        }
    }
    
    let cellBackgroundImage: UIImageView = {
        let cellImage = UIImageView()
        cellImage.image = UIImage(named: "blueGradient")
        cellImage.clipsToBounds = true
        cellImage.contentMode = .scaleAspectFill
        return cellImage
    }()
    

    let locationLabel: UILabel = {
       
        let label = UILabel()
        label.text = "--"
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 22)
        label.textAlignment = .center
        
        return label
    }()
    
    let weatherQuickTip: UILabel = {
        
        let label = UILabel()
        //label.backgroundColor = UIColor.black
        label.text = "--"
        label.textColor = UIColor.setTransParency(redColor: 235, green: 235, blue: 235)
        label.textAlignment = .left
        label.numberOfLines = 7
        label.font = UIFont.systemFont(ofSize: 14)

        return label
    }()
    
    let mainTempLabel: UILabel = {
        
        let label = UILabel()
        label.text = "--"
        label.textColor = UIColor.white
        //label.backgroundColor = UIColor.purple
        label.font = UIFont.systemFont(ofSize: 50)
        label.textAlignment = .center
        
        return label
    }()
    
    let percipChanceLabel: UILabel = {
        
        let label = UILabel()
        label.text = "--"
        label.textColor = UIColor.white
        //label.backgroundColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 18)
        label.textAlignment = .center
        
        return label
    }()
    
    let dateLabel: UILabel = {
        
        let label = UILabel()
        label.text = "--"
        label.textColor = UIColor.white
        //label.backgroundColor = UIColor.white
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textAlignment = .center
        
        return label
    }()
    
    let windSpeedLabel: UILabel = {
        
        let label = UILabel()
        label.text = "--"
        label.textColor = UIColor.white
        //label.backgroundColor = UIColor.white
        label.font = UIFont.boldSystemFont(ofSize: 14
        )
        label.textAlignment = .center
        
        return label
    }()
    
    let percipImage: UIImageView = {
        let weatherImage = UIImageView()
        //weatherImage.backgroundColor = UIColor.green
        weatherImage.image = UIImage(named: "percipImage")
        weatherImage.contentMode = .scaleAspectFit
        weatherImage.clipsToBounds = true
        return weatherImage
    }()
    
    let windImage: UIImageView = {
        let weatherImage = UIImageView()
        //weatherImage.backgroundColor = UIColor.green
        weatherImage.image = UIImage(named: "Map-Marker-Flag--Right-Azure")
        weatherImage.contentMode = .scaleAspectFit
        weatherImage.clipsToBounds = true
        return weatherImage
    }()
    
    let weatherImage: UIImageView = {
        let weatherImage = UIImageView()
        //weatherImage.backgroundColor = UIColor.green
        weatherImage.image = UIImage(named: "")
        weatherImage.contentMode = .scaleAspectFit
        weatherImage.clipsToBounds = true
        return weatherImage
    }()
    
    let divider: UIView = {
        
        let view = UIView()
        view.backgroundColor = UIColor.setTransParency(redColor: 220, green: 220, blue: 220)
        return view
    }()
    
    let dateAndCityDivider: UIView = {
        
        let view = UIView()
        view.backgroundColor = UIColor.white//UIColor.setTransParency(redColor: 220, green: 220, blue: 220)
        return view
    }()
    
    override init(frame:
        CGRect){
        super.init(frame: frame)
        //backgroundColor = UIColor.red
        setUpViews()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpViews() {

        addSubview(cellBackgroundImage)
        addSubview(locationLabel)
        addSubview(dateAndCityDivider)
        addSubview(percipImage)
        addSubview(percipChanceLabel)
        addSubview(weatherImage)
        addSubview(windImage)
        addSubview(windSpeedLabel)
        addSubview(mainTempLabel)
        addSubview(divider)
        addSubview(dateLabel)
        addSubview(weatherQuickTip)
        
        addConstraint(NSLayoutConstraint(item: divider, attribute: .top, relatedBy: .equal, toItem: mainTempLabel, attribute: .bottom, multiplier: 1, constant: 8))
        addConstraint(NSLayoutConstraint(item: divider, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 1))
        
        addConstraint(NSLayoutConstraint(item: dateAndCityDivider, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: dateAndCityDivider, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: -80))
        
        addConstraint(NSLayoutConstraint(item: dateLabel, attribute: .left, relatedBy: .equal, toItem: dateAndCityDivider, attribute: .right, multiplier: 1, constant: -3))
        addConstraint(NSLayoutConstraint(item: dateLabel, attribute: .bottom, relatedBy: .equal, toItem: weatherImage, attribute: .top, multiplier: 1, constant: -10))
        addConstraint(NSLayoutConstraint(item: dateLabel, attribute: .right, relatedBy: .equal, toItem: windSpeedLabel, attribute: .right, multiplier: 1, constant: 0))
        
        addConstraint(NSLayoutConstraint(item: weatherQuickTip, attribute: .top, relatedBy: .equal, toItem: weatherImage, attribute: .bottom, multiplier: 1, constant: 30))
        
        addConstraint(NSLayoutConstraint(item: weatherImage, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: weatherImage, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: -10))
        
        addConstraint(NSLayoutConstraint(item: mainTempLabel, attribute: .bottom, relatedBy: .equal, toItem: weatherImage, attribute: .top, multiplier: 1, constant: 5))
        
        addContraints(formatString: "H:|-8-[v0]-8-|", view: weatherQuickTip)
 
        addContraints(formatString:"H:|[v0]|", view: divider)
        addContraints(formatString:"V:[v0]-1-|", view:divider)
        
        addContraints(formatString: "H:[v0]", view: dateLabel)
        addContraints(formatString: "V:[v0(20)]", view: dateLabel)
        
        addContraints(formatString: "H:[v0(1)]", view: dateAndCityDivider)
        addContraints(formatString: "V:[v0(30)]", view: dateAndCityDivider)
        
        addContraints(formatString: "H:|-8-[v0]-8-|", view: locationLabel)
        
        addContraints(formatString: "H:|[v0]|", view: cellBackgroundImage)
        addContraints(formatString: "V:|[v0]|", view: cellBackgroundImage)
        
        addContraints(formatString: "H:[v0(100)]", view: weatherImage)
        addContraints(formatString: "V:[v0(100)]", view: weatherImage)
        
        addContraints(formatString: "V:|-8-[v0(30)]-120-[v1(20)]", view: locationLabel, percipImage)
        addContraints(formatString: "H:|-25-[v0(20)]", view: percipImage)
    
        addContraints(formatString: "V:[v0]-110-[v1(40)]", view:locationLabel, percipChanceLabel)

        addContraints(formatString: "H:|-15-[v0]-6-[v1]-30-[v2]-30-[v3(20)]-3-[v4]-8-|", view:percipImage,percipChanceLabel, weatherImage, windImage,windSpeedLabel)
        
        addContraints(formatString: "V:[v0]-120-[v1(20)]", view: locationLabel, windImage)
 
        addContraints(formatString: "V:[v0]-110-[v1(40)]", view:locationLabel,windSpeedLabel)
        
        addContraints(formatString: "H:|-8-[v0]", view: mainTempLabel)


    }
    
}
