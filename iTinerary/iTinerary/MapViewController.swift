//
//  MapViewController.swift
//  iTinerary
//
//  Created by Melissa Ho on 3/12/22.
//

import UIKit
import MapKit

class MapViewController: UIViewController
, MKMapViewDelegate
{
    
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        let initialLocation = CLLocationCoordinate2D(latitude: 37.77986, longitude: -122.42905)
//        mapView.setCenter(initialLocation, animated: true)
        mapView.setRegion(MKCoordinateRegion(center: initialLocation, latitudinalMeters: 20000, longitudinalMeters: 20000), animated: true)
    }
    
    
}

private extension MKMapView {
  func centerToLocation(
    _ location: CLLocation,
    regionRadius: CLLocationDistance = 1000
  ) {
    let coordinateRegion = MKCoordinateRegion(
      center: location.coordinate,
      latitudinalMeters: regionRadius,
      longitudinalMeters: regionRadius)
    setRegion(coordinateRegion, animated: true)
  }
}

