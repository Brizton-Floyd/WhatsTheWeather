//
//  LocationProvider.swift
//  WhatsTheWeather
//
//  Created by brizton floyd on 10/14/16.
//  Copyright © 2016 brizton floyd. All rights reserved.
//

import UIKit
import Foundation
import CoreLocation

class LocationProvider:NSObject, CLLocationManagerDelegate {
    
    override init(){
            super.init()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
    }
    
    var  locationManager = CLLocationManager()
    static var location = LocationProvider()
    private var currentLocation: CLLocation!
    
    func getLocation(){
        
        currentLocation = locationManager.location
        
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
            
            LocationCoordinates.sharedInstance.lattitude = currentLocation.coordinate.latitude as NSNumber?
            LocationCoordinates.sharedInstance.longitude = currentLocation.coordinate.longitude as NSNumber?
            
        }
        else{
            locationManager.requestWhenInUseAuthorization()
            getLocation()
        }
    }
}
