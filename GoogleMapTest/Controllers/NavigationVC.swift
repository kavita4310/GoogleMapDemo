//
//  NavigationVC.swift
//  GoogleMapTest
//
//  Created by MACMINI on 02/03/23.
//

import UIKit
import GoogleMaps
import CoreLocation
import GooglePlaces

class NavigationVC: UIViewController,CLLocationManagerDelegate,GMSMapViewDelegate {
    
   // MARK :- IBoutles
    
    @IBOutlet weak var viewMap: UIView!
    @IBOutlet weak var tfCurrentLocation: UITextField!
    @IBOutlet weak var tfDestination: UITextField!
    
    // MARK :- Properties
    var locationManager = CLLocationManager()
    let mapView = GMSMapView()
    var currentAddress = false
    var destiNation = false
    
    // MARK :- ViewController life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        mapView.frame = viewMap.bounds
        self.mapView.addSubview(viewMap)
        let marker = GMSMarker()
        
        locationManager.requestAlwaysAuthorization()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = 10
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
        mapView.settings.myLocationButton = true
        mapView.settings.rotateGestures = true
        mapView.settings.zoomGestures = true
      
        marker.map = self.mapView
    }
    
    
    @IBAction func actionCurrentLocation(_ sender: Any) {
       currentlocation()
    }
    
    @IBAction func actionDestination(_ sender: Any) {
        destination()
    }
    func currentlocation() {
   
            tfCurrentLocation.becomeFirstResponder()
            let autoComplete = GMSAutocompleteViewController()
            autoComplete.delegate = self
            present(autoComplete, animated: true, completion: nil)
    }
    func destination(){
            tfDestination.becomeFirstResponder()
            let autoComplete = GMSAutocompleteViewController()
            autoComplete.delegate = self
            present(autoComplete, animated: true, completion: nil)
      
    }
    
    
    
   
}
extension NavigationVC: GMSAutocompleteViewControllerDelegate {
    
    func viewController(_ viewController: GMSAutocompleteViewController, didAutocompleteWith place: GMSPlace) {
      
            tfCurrentLocation.text = place.name
      
            let coord = CLLocationCoordinate2D(latitude: place.coordinate.latitude, longitude: place.coordinate.longitude)
            Location.shared.setAddress(address: LocationProperties(latitude: coord.latitude, longitude: coord.longitude, address: place.formattedAddress ?? "null" ))
            let marker = GMSMarker()
            marker.position = coord
            marker.title = place.name
            marker.snippet = place.formattedAddress
            marker.icon = UIImage(named: "default_marker")
            marker.map = self.mapView
            self.mapView.camera = GMSCameraPosition.camera(withTarget: coord, zoom: 15)
           dismiss(animated: true, completion: nil)
       
    }
    
    func viewController(_ viewController: GMSAutocompleteViewController, didFailAutocompleteWithError error: Error) {
        print(error.localizedDescription)
    }
    
    func wasCancelled(_ viewController: GMSAutocompleteViewController) {
        dismiss(animated: true, completion: nil)
    }
    
    
}
