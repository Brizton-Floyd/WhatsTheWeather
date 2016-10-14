//
//  Constants.swift
//  WhatsTheWeather
//
//  Created by brizton floyd on 10/14/16.
//  Copyright © 2016 brizton floyd. All rights reserved.
//

import Foundation

let WEATHER_URL = "https://api-ak-aws.wunderground.com/api/8dee7a0127c63e7f/forecast10day/hourly10day/astronomy10day/geolookup/alerts/conditions/lang:EN/units:english/v:2.0/q/\(LocationCoordinates.sharedInstance.lattitude),\(LocationCoordinates.sharedInstance.longitude).json?ttl=300"

