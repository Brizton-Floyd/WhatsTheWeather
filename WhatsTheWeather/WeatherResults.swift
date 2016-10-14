//
//  WeatherResults.swift
//  WhatsTheWeather
//
//  Created by brizton floyd on 10/14/16.
//  Copyright © 2016 brizton floyd. All rights reserved.
//

import Foundation
import UIKit

class WeatherResults : NSObject{
    
    var currentWeather: CurrentWeather?
    var forecast: [Forecast]?
    
    static func fetchWeatherData(completionHandler:@escaping (WeatherResults)->()) {
        
        let url = URL(string: WEATHER_URL)
        print(url)
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            
            if error != nil {
                print(error)
                return
            }
            
            do{
                
                let json = try(JSONSerialization.jsonObject(with: data!, options: .mutableContainers))
                
                var weatherResult = WeatherResults()
                print(json)
                DispatchQueue.main.async(execute: { 
                    completionHandler(weatherResult)
                })
    
                
            }catch let err {
                print(err)
            }
            
        }.resume()
    }
}
