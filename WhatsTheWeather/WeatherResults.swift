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
                
                let json = try(JSONSerialization.jsonObject(with: data!, options: .mutableContainers)) as! [String:AnyObject]
                
                let weather = CurrentWeather()
                var forcasts = [Forecast]()
                let weatherResults = WeatherResults()
                if let dictionary = json["response"] as? [String:AnyObject]{
                    
                    if let location = dictionary["location"] as? [String:AnyObject] {
                        
                        weather.city = location["name"] as? String
                        weather.state = location["state_name"] as? String
                    }
                    
                    if let currentObservation = json["current_observation"] as? [String:AnyObject] {
                        let url = currentObservation["icon"] as? String
                        weather.iconImage = url!
                        weather.windSpeed = currentObservation["wind_speed"] as? NSNumber
                        weather.temperature = currentObservation["temperature"] as? NSNumber
                        weather.liquidPercip = currentObservation["precip_1hr"] as? NSNumber
                    }
                    
                    if let date = dictionary["date"] as? [String:AnyObject] {

                        weather.day = date["day"]as? NSNumber
                        weather.month = date["monthname"] as? String
                        weather.weekday = date["weekday"] as? String
                    }
                    
                    var count = 0
                    if let tenDayForeCast = json["forecast"] as? [String:AnyObject] {
                        
                        for days in (tenDayForeCast["days"] as? [[String:AnyObject]])! {
                            
                            let forecast = Forecast()
                            
                            if let summary = days["summary"] as? [String:AnyObject] {

                                forecast.highTemp = summary["high"] as? NSNumber
                                forecast.condition = summary["condition"] as? String
                                forecast.imageIcon = summary["icon"] as? String
                                forecast.lowTemp = summary["low"] as? NSNumber

                                if count == 0 {
                                    
                                    if let currentsummary = summary["day"] as? [String:AnyObject] {
                                          weather.weatherSummary = currentsummary["text"] as? String
                                        count = count + 1
                                    }
                                }
                                if let dayInfo = summary["day"] as? [String:AnyObject] {
                                    
                                    forecast.dayOfWeek = dayInfo["title"] as? String
                                }
                            }

                            forcasts.append(forecast)
                        }
                        
                    }
                    
                    
                }
                
                weatherResults.currentWeather = weather
                weatherResults.forecast = forcasts
                
                DispatchQueue.main.async(execute: { 
                    completionHandler(weatherResults)
                })
    
                
            }catch let err {
                print(err)
            }
            
        }.resume()
    }
}
