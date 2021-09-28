//
//  ViewController.swift
//  NamesOfLocations
//
//  Created by Emmanuel Omokagbo on 28/09/2021.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController {
    
    private let mapView: MKMapView = {
        let map = MKMapView()
        map.isScrollEnabled = true
        map.isZoomEnabled = true
        map.showsUserLocation = true
        return map
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(mapView)
        navigationController?.navigationBar.prefersLargeTitles = true
        addUserLocationToMap()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        mapView.frame = view.bounds
    }
    
    private func addUserLocationToMap() {
        DispatchQueue.main.async {
            LocationManager.shared.getUserLocation { [weak self] location in
                self?.addMapPin(with: location)
            }
        }
    }
    
    private func addMapPin(with location: CLLocation) {
        let pin = MKPointAnnotation()
        pin.coordinate = location.coordinate
        mapView.setRegion(MKCoordinateRegion(center: location.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.7, longitudeDelta: 0.7)), animated: true)
        mapView.addAnnotation(pin)
        LocationManager.shared.resolveLocationName(with: location) { [weak self] locationName in
            self?.title = locationName
        }
    }
    
}

