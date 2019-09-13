//
//  LocationManager.swift
//  Places
//
//  Created by Anthony Guella on 8/4/19.
//  Copyright © 2019 Anthony Guella. All rights reserved.
//

import Foundation
import CoreLocation

class LocationManager: NSObject {
    
    private var subscribers = NSHashTable<AnyObject>.weakObjects()
    
    var locationManager: CLLocationManager!
    
    override init() {
        super.init()
        setup()
    }
    
    private func setup() {
        if CLLocationManager.locationServicesEnabled() {
            locationManager = CLLocationManager()
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.requestAlwaysAuthorization()
            locationManager.startUpdatingLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = manager.location else {
            return
        }
        let coordinates = location.coordinate
        subscribers.allObjects.compactMap { $0 as? LocationManagerObserver }
            .forEach {
                $0.currentLocationUpdated(coordinates)
        }
    }
}

extension LocationManager: LocationManagerType {
    func addObserver(_ observer: LocationManagerObserver) {
        subscribers.add(observer)
    }
    
    func removeObserver(_ observer: LocationManagerObserver) {
        subscribers.remove(observer)
    }
}
