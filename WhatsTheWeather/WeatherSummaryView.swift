//
//  WeatherSummaryView.swift
//  WhatsTheWeather
//
//  Created by brizton floyd on 10/12/16.
//  Copyright © 2016 brizton floyd. All rights reserved.
//

import UIKit

class WeatherSummaryView : UIView {
    
    lazy var collectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        //view.backgroundColor = UIColor.red

        return view
    }()
    
    let cellBackgroundImage: UIImageView = {
        let cellImage = UIImageView()
        cellImage.image = UIImage(named: "blueGradient")
        cellImage.clipsToBounds = true
        cellImage.contentMode = .scaleAspectFill
        return cellImage
    }()
    

    let locationLabel: UILabel = {
       
        let label = UILabel()
        label.text = "San Francisco"
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 22)
        label.textAlignment = .center
        
        return label
    }()
    
    let mainTempLabel: UILabel = {
        
        let label = UILabel()
        label.text = "85°F"
        label.textColor = UIColor.white
       // label.backgroundColor = UIColor.purple
        label.font = UIFont.systemFont(ofSize: 140)
        label.textAlignment = .center
        
        return label
    }()
    
    let percipChanceLabel: UILabel = {
        
        let label = UILabel()
        label.text = "50%"
        label.textColor = UIColor.white
       // label.backgroundColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 18)
        label.textAlignment = .center
        
        return label
    }()
    
    let windSpeedLabel: UILabel = {
        
        let label = UILabel()
        label.text = "6mph"
        label.textColor = UIColor.white
        //label.backgroundColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 18)
        label.textAlignment = .center
        
        return label
    }()
    
    let percipImage: UIImageView = {
        let weatherImage = UIImageView()
        //weatherImage.backgroundColor = UIColor.green
        weatherImage.image = UIImage(named: "Raindrop")
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
        weatherImage.image = UIImage(named: "Clear")
        weatherImage.contentMode = .scaleAspectFill
        weatherImage.clipsToBounds = true
        return weatherImage
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
        
        addSubview(percipImage)
        addSubview(percipChanceLabel)
        addSubview(weatherImage)
        addSubview(windImage)
        addSubview(windSpeedLabel)
        addSubview(mainTempLabel)
        
        addContraints(formatString: "H:|-25-[v0]-25-|", view: locationLabel)
        
        addContraints(formatString: "H:|[v0]|", view: cellBackgroundImage)
        addContraints(formatString: "V:|[v0]|", view: cellBackgroundImage)

        addConstraint(NSLayoutConstraint(item: weatherImage, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: weatherImage, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: -70))
        
        addContraints(formatString: "H:[v0(100)]", view: weatherImage)
        addContraints(formatString: "V:[v0(100)]", view: weatherImage)
        
        addContraints(formatString: "V:|-8-[v0(30)]-80-[v1(20)]", view: locationLabel, percipImage)
        addContraints(formatString: "H:|-25-[v0(20)]", view: percipImage)
    
        addContraints(formatString: "V:[v0]-75-[v1(40)]", view:locationLabel, percipChanceLabel)

        addContraints(formatString: "H:|-8-[v0]-6-[v1]-30-[v2]-30-[v3(20)]-3-[v4]-8-|", view:percipImage,percipChanceLabel, weatherImage, windImage,windSpeedLabel)
        
        addContraints(formatString: "V:[v0]-83-[v1(20)]", view: locationLabel, windImage)
 
        addContraints(formatString: "V:[v0]-75-[v1(40)]", view:locationLabel,windSpeedLabel)
        
        addContraints(formatString: "H:|[v0]|", view: mainTempLabel)
        addContraints(formatString: "V:[v0]-6-[v1]|", view:weatherImage, mainTempLabel)

    }
    
}
