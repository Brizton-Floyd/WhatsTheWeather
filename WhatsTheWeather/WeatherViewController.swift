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
    private var weatherData: WeatherResults?
    var location: LocationProvider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        location = LocationProvider()
        
        
        // set the text on the navigation controller
        let title = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width / 3, height: view.frame.height))
        title.text = "Whats The Weather"
        title.textColor = UIColor.white
        title.font = UIFont.systemFont(ofSize: 20)
        navigationItem.titleView = title
        
        collectionView?.backgroundColor = UIColor(patternImage: UIImage(named: "blueGradient")!)
        collectionView?.register(ForecastCell.self, forCellWithReuseIdentifier: forecastCell)
        navigationController?.navigationBar.isTranslucent = false
        
        collectionView?.contentInset = UIEdgeInsets(top: view.frame.height / 2.17, left: 0, bottom: 12.3, right: 0)
        collectionView?.scrollIndicatorInsets = UIEdgeInsets(top: view.frame.height / 2.17, left: 0, bottom: 0, right: 0)
        
        
        setUpNavBarButtons()
        location.getLocation()
        
        // Fetch Weather Data
        WeatherResults.fetchWeatherData { (weatherResults) in
            
            self.weatherData = weatherResults
            self.weatherData?.forecast?.remove(at: 0)
            self.weatherSummary.summaryData = self.weatherData?.currentWeather
            self.setUpWeatherSummaryView()
            self.collectionView?.reloadData()
        }
        //DispatchQueue.main.async {
            
   
        //}
        //getLocationAndWeather()
    }

    override func viewDidAppear(_ animated: Bool) {

    }
    func setUpNavBarButtons() {
        let refreshImage = UIImage(named: "refresh")?.withRenderingMode(.alwaysOriginal)
        let refreshImageItem = UIBarButtonItem(image: refreshImage, style: .plain, target: self, action: #selector(reloadData))
        
        navigationItem.rightBarButtonItems = [refreshImageItem]
    }
    
    func reloadData() {
        
        getLocationAndWeather()
    }
    
    func getLocationAndWeather() {

        location.getLocation()
        // Fetch Weather Data
        WeatherResults.fetchWeatherData { (weatherResults) in
            
            self.weatherData = weatherResults
            self.weatherData?.forecast?.remove(at: 0)
            self.weatherSummary.summaryData = self.weatherData?.currentWeather
            self.collectionView?.reloadData()
        }

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
        
        if let count = weatherData?.forecast?.count {
            return count
        }
        return 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: forecastCell, for: indexPath) as! ForecastCell
        
        cell.forecastDetails = weatherData?.forecast?[indexPath.item]
    
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: view.frame.width, height: 100)
    }
    
  
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
}

