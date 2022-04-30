//
//  PinViewController.swift
//  iTinerary
//
//  Created by Jimmy Nguyen on 4/29/22.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController {
    
    let map = MKMapView()
    let point = CLLocationCoordinate2D (
        latitude: 40,
        longitude: -74
    )
    override func viewDidLoad(){
        super.viewDidLoad()
        view.addSubview(map)
        map.frame = view.bounds
    }
}
