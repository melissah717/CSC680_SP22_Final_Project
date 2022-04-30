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
    let pinMapView = MKMapView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        let initialLocation = CLLocationCoordinate2D(latitude: 37.77986, longitude: -122.42905)
//        mapView.setCenter(initialLocation, animated: true)
        mapView.setRegion(MKCoordinateRegion(center: initialLocation, latitudinalMeters: 20000, longitudinalMeters: 20000), animated: true)
    }
    
    private func makePin() {
        let myPin = MKPointAnnotation()
        let pinCoordinate = CLLocationCoordinate2D(latitude: 37.77986, longitude: -122.42905)

        myPin.coordinate = pinCoordinate
        myPin.title = "Example Pin"
        myPin.subtitle = "This is a test"
        pinMapView.addAnnotation(myPin)
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard !(annotation is MKUserLocation) else {
            return nil
        }
        
        var annotationView = pinMapView.dequeueReusableAnnotationView(withIdentifier: "custom")
        if annotationView == nil {
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "custom")
            annotationView?.canShowCallout = true
        } else {
            annotationView?.annotation = annotation
        }
        annotationView?.image = UIImage(named:"lemons")
        return annotationView
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

