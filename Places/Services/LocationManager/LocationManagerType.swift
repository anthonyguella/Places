//
//  LocationManagerType.swift
//  Places
//
//  Created by Anthony Guella on 8/5/19.
//  Copyright © 2019 Anthony Guella. All rights reserved.
//

import Foundation
import CoreLocation

protocol LocationManagerType: NSObject, CLLocationManagerDelegate {
    func addObserver(_ observer: LocationManagerObserver)
    func removeObserver(_ observer: LocationManagerObserver)
}

protocol LocationManagerObserver: class {
    func currentLocationUpdated(_ coordinates: CLLocationCoordinate2D)
}
