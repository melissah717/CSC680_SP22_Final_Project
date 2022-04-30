//
//  MapViewController.swift
//  iTinerary
//
//  Created by Melissa Ho on 3/12/22.
//

import UIKit
import MapKit

class MapViewController: UIViewController, UISearchResultsUpdating {
    
    let mapView = MKMapView()
    
    let searchVC = UISearchController(searchResultsController: ResultsViewController())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(mapView)
        searchVC.searchBar.backgroundColor = .secondarySystemBackground
        searchVC.searchResultsUpdater = self
        navigationItem.searchController = searchVC
        
        let initialLocation = CLLocationCoordinate2D(latitude: 37.77986, longitude: -122.42905)
        title = "Map"
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
}

extension MapViewController: ResultsViewControllerDelegate {
    func didTapPlace(with coordinates: CLLocationCoordinate2D) {
        // Removes the recently searched text from the search bar
        searchVC.searchBar.resignFirstResponder()
        // Hides the keyboard after selecting a search result
        searchVC.dismiss(animated: true, completion: nil)
        
        // Removing all map pins - NOT WORKING PROPERLY ATM
        let leftOverPins = mapView.annotations
        mapView.removeAnnotations(leftOverPins)
        
        // Adding a map pin
        let pin = MKPointAnnotation()
        pin.coordinate = coordinates
        mapView.addAnnotation(pin)
        mapView.setRegion(MKCoordinateRegion(center: coordinates, span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)), animated: true)
    }
}
