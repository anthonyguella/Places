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
    
    @IBOutlet var mapView: MKMapView!
    
    var locationManager: LocationManagerType!

    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.addObserver(self)
        self.navigationController?.isNavigationBarHidden = true
        mapView.setUserTrackingMode(.follow, animated: true)
    }
    
    func inject(locationManager: LocationManagerType) {
        self.locationManager = locationManager
    }
    
    deinit {
        locationManager.removeObserver(self)
    }
    
    func currentLocationUpdated(_ coordinates: CLLocationCoordinate2D) {
        //let region = MKCoordinateRegion(center: coordinates, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        //mapView.setRegion(region, animated: true)
        //mapView.setUserTrackingMode(.follow, animated: true)
    }
    
}

