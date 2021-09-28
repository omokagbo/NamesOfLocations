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
        return map
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(mapView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        mapView.frame = view.bounds
    }
    
}

