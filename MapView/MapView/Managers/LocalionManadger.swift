//
//  LocalionManadger.swift
//  MapView
//
//  Created by Ваня Науменко on 12.04.23.
//

import Foundation
import MapKit

// MARK: - LocationManager

class LocationManager: NSObject, ObservableObject {

    private let locationManager = CLLocationManager()
    @Published var location: CLLocation? = nil

    override init() {

        super.init()
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.distanceFilter = kCLDistanceFilterNone
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
    }
}
  
// MARK: CLLocationManagerDelegate

extension LocationManager: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        print(status)
    }
    
//    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
//        print("\(OSStatus())")
//    }
    
    private func locationManager(_ manager: CLLocationManager, didUpdateLocatins locations: [CLLocation]) {
        guard let location = locations.last else {
            return
        }
        self.location = location
    }
}
