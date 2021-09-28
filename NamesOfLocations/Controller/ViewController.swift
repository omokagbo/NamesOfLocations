//
//  ViewController.swift
//  NamesOfLocations
//
//  Created by Emmanuel Omokagbo on 28/09/2021.
//

import UIKit
import MapKit

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
        LocationManager.shared.getUserLocation { [weak self] location in
            DispatchQueue.main.async {
                let pin = MKPointAnnotation()
                pin.coordinate = location.coordinate
                self?.mapView.setRegion(MKCoordinateRegion(center: location.coordinate, latitudinalMeters: 10000, longitudinalMeters: 10000), animated: true)
                self?.mapView.addAnnotation(pin)
            }
        }
    }
    
}

