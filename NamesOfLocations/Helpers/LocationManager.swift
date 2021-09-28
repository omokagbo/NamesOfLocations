//
//  LocationManager.swift
//  NamesOfLocations
//
//  Created by Emmanuel Omokagbo on 28/09/2021.
//

import Foundation
import CoreLocation


class LocationManager: NSObject {
    
    static let shared = LocationManager()
    
    private let locationManager = CLLocationManager()
    
    var completion: ((CLLocation) -> Void)?
    
    private override init() {}
    
    func getUserLocation(completion: @escaping ((CLLocation) -> Void)) {
        self.completion = completion
        locationManager.requestWhenInUseAuthorization()
        locationManager.delegate = self
        locationManager.startUpdatingLocation()
    }
}

extension LocationManager: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else {
            return
        }
        completion?(location)
        locationManager.stopUpdatingLocation()
    }
}
