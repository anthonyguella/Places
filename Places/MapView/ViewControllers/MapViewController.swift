//
//  MapViewController.swift
//  Places
//
//  Created by Anthony Guella on 8/4/19.
//  Copyright © 2019 Anthony Guella. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController, CLLocationManagerDelegate, LocationManagerObserver {
    
    var locationManager: LocationManagerType!
    
    func currentLocationUpdated(_ coordinates: CLLocationCoordinate2D) {
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.addObserver(self)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    func inject(locationManager: LocationManagerType) {
        self.locationManager = locationManager
    }
    
    deinit {
        locationManager.removeObserver(self)
    }
}

