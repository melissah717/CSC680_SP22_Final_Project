//
//  MapViewController.swift
//  iTinerary
//
//  Created by Melissa Ho on 3/12/22.
//
//  Reference: https://www.youtube.com/watch?v=Cd-B5_vkOFs&t=286s&ab_channel=iOSAcademy

import UIKit
import MapKit

class MapViewController: UIViewController, UISearchResultsUpdating, MKMapViewDelegate {
    
    var address: String?
    let mapView = MKMapView()
    let searchVC = UISearchController(searchResultsController: ResultsViewController())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(mapView)
        searchVC.searchBar.backgroundColor = .secondarySystemBackground
        searchVC.searchResultsUpdater = self
        mapView.delegate = self
        navigationItem.searchController = searchVC
        title = "Map"
        
        if(address != nil){
            searchVC.searchBar.text = address
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        mapView.frame = CGRect(x: 0, y: view.safeAreaInsets.top, width: view.frame.width, height: view.frame.height - view.safeAreaInsets.top)
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let query = searchController.searchBar.text,
              !query.trimmingCharacters(in: .whitespaces).isEmpty,
              let resultsVC = searchController.searchResultsController as? ResultsViewController else {
                  return
              }
        
        resultsVC.delegate = self
        
        GooglePlacesManager.shared.findPlaces(query: query) { result in
            switch result {
            case .success(let places):
                
                DispatchQueue.main.async {
                    resultsVC.update(with: places)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: "custom")
        if annotationView == nil {
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "custom")
            annotationView?.canShowCallout = true
        } else {
            annotationView?.annotation = annotation
        }
        
        annotationView?.image = UIImage(named: "lemons")
        
        return annotationView
    }
    
}

extension MapViewController: ResultsViewControllerDelegate {
    func didTapPlace(with coordinates: CLLocationCoordinate2D) {
        // Removes the recently searched text from the search bar
        searchVC.searchBar.resignFirstResponder()
        // Hides the keyboard after selecting a search result
        searchVC.dismiss(animated: true, completion: nil)
        
        // Removing all map pins
        let leftOverPins = mapView.annotations
        mapView.removeAnnotations(leftOverPins)
        
        // Adding a map pin
        let pin = MKPointAnnotation()
        pin.coordinate = coordinates
        mapView.addAnnotation(pin)
        mapView.setRegion(MKCoordinateRegion(center: coordinates, span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)), animated: true)
    }
}
