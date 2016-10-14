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
        
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
    }
    
    var locationManager: CLLocationManager!
    var location: LocationProvider?
    
    func getLocation(){
        
        if (locationManager.responds(to: #selector(CLLocationManager.requestWhenInUseAuthorization))) {
            locationManager.requestWhenInUseAuthorization()
        }else{
            
            locationManager.startUpdatingLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        
        print("Error to update location", error)
    }
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        
        switch status {
        case .notDetermined:break
        case .restricted:break
        case .denied:print("Do some error handling")
        break
        default:
            
            locationManager.startUpdatingLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let yourLastLocation = locations.last! as CLLocation
        LocationCoordinates.sharedInstance.lattitude = yourLastLocation.coordinate.latitude as NSNumber
        LocationCoordinates.sharedInstance.longitude = yourLastLocation.coordinate.longitude as NSNumber
    }
}
