//
//  ViewController.swift
//  WhatsTheWeather
//
//  Created by brizton floyd on 10/12/16.
//  Copyright © 2016 brizton floyd. All rights reserved.
//

import UIKit

class WeatherViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    
    private let forecastCell = "forecastCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()

       // navigationItem.title = "Whats The Weather"
        
        // set the text on the navigation controller
        let title = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width / 3, height: view.frame.height))
        title.text = "Whats The Weather"
        title.textColor = UIColor.white
        title.font = UIFont.systemFont(ofSize: 20)
        navigationItem.titleView = title
        
        collectionView?.backgroundColor = UIColor(patternImage: UIImage(named: "blueGradient")!)
        collectionView?.register(ForecastCell.self, forCellWithReuseIdentifier: forecastCell)
        navigationController?.navigationBar.isTranslucent = false
        
        
        collectionView?.contentInset = UIEdgeInsets(top: view.frame.height / 1.96, left: 0, bottom: 0, right: 0)
        collectionView?.scrollIndicatorInsets = UIEdgeInsets(top: view.frame.height / 1.96, left: 0, bottom: 0, right: 0)
        
        setUpWeatherSummaryView()
    }
    
    let weatherSummary: WeatherSummaryView = {
        let view = WeatherSummaryView()
        
        return view
    }()
    
    func setUpWeatherSummaryView() {
        view.addSubview(weatherSummary)
        
        view.addContraints(formatString: "H:|[v0]|", view: weatherSummary)
        view.addContraints(formatString: "V:|[v0(\((view.frame.height / 2) + 6))]|", view: weatherSummary)
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 10
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: forecastCell, for: indexPath) as! ForecastCell
    
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: view.frame.width, height: 100)
    }
    
  
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
}

