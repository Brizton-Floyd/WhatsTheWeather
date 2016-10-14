//
//  LocationCoordinates.swift
//  WhatsTheWeather
//
//  Created by brizton floyd on 10/14/16.
//  Copyright © 2016 brizton floyd. All rights reserved.
//

import Foundation

class LocationCoordinates:NSObject {
    
    static var sharedInstance = LocationCoordinates()
    var lattitude: NSNumber!
    var longitude: NSNumber!
}
