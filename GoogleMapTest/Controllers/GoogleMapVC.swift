//
//  GoogleMapVC.swift
//  GoogleMapTest
//
//  Created by MACMINI on 20/02/23.
//

import UIKit
import GoogleMaps
import GooglePlaces
import CoreLocation
import GoogleMapsUtils

class GoogleMapVC: UIViewController, GMSMapViewDelegate,CLLocationManagerDelegate, GMUClusterManagerDelegate{
   
    
   // MARK :- IBOutlets
    
    @IBOutlet weak var mapMarkerView: UIView!
    @IBOutlet weak var tfAddress: UITextField!

    // MARK :- Properties
    
    var mapView = GMSMapView()
    var locationManager = CLLocationManager()
    let marker = GMSMarker()
    var clusterManager: GMUClusterManager!
    var address = [LocationProperties]()
    var country = ""
    var tapping = true
    var searching = true
   
    
    // MARK :- UiViewController life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
           mapView.frame = mapMarkerView.bounds
           self.mapMarkerView.addSubview(mapView)
           mapView.delegate = self
     
           locationManager.requestAlwaysAuthorization()
           if CLLocationManager.locationServicesEnabled(){
               locationManager.delegate = self
               locationManager.desiredAccuracy = kCLLocationAccuracyBest
               locationManager.distanceFilter = 10
               locationManager.requestWhenInUseAuthorization()
               locationManager.requestAlwaysAuthorization()
               locationManager.startUpdatingLocation()
           }
           mapView.settings.myLocationButton = true
           mapView.settings.zoomGestures = true
           
       // NotificationCenter.default.addObserver(self, selector: #selector(dataPassing), name:Notification.Name("XYZ"), object: nil)
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setMap()
    }
    
    func setMap(){
        self.address = Location.shared.getAddresses()
        mapView.clear()
        
        for add in self.address{
            let location = CLLocationCoordinate2D(latitude: add.latitude, longitude: add.longitude)
           let markers = GMSMarker()
        markers.position = location
            markers.title = add.address
        markers.map = mapView
        markers.icon = UIImage(named: "default_marker")
            self.mapView.camera = GMSCameraPosition.camera(withTarget: location, zoom: 10)
        }
        
        
    }
    
    
    // MARK :- Function Notification Calling
    
//    @objc func dataPassing(_ sender:Notification){
//        if let d  = sender.userInfo as? [String:Any] {
//            let ind = (d["indx"] as? Int)
//            address.remove(at: ind!)
//            print("this is receive address\(address)")
//        }
       
       
//    }
    
    @IBAction func actionSearchAddress(_ sender: Any) {
        gotoPlace()
    }
    // MARK :- Function Search Place
    
    func gotoPlace() {
        tfAddress.resignFirstResponder()
        let autocomplete = GMSAutocompleteViewController()
        autocomplete.delegate = self
        present(autocomplete, animated: true, completion: nil)
    }
    

    // MARK :- Function Coordinate Geolocation

    func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
        
        if tapping == true {
//                let location = CLLocationCoordinate2D(latitude: coordinate.latitude, longitude: coordinate.longitude)
//               let markers = GMSMarker()
//            markers.position = location
//            markers.title = "Location"
//            markers.map = mapView
//            markers.icon = UIImage(named: "default_marker")
//            self.mapView.camera = GMSCameraPosition.camera(withTarget: location, zoom: 15)
                self.getAddress(lat: coordinate.latitude, long: coordinate.longitude)

//            NotificationCenter.default.post(name: Notification.Name("GET_DATA"), object: nil, userInfo: ["data":address])
            
        }else {
            searching = false

        }

    }
    
    // MARK :- Function Fetch Address through lat/long

    func getAddress(lat: Double,long: Double)  {

     let geoCoder = CLGeocoder()
     let location = CLLocation(latitude: lat , longitude: long)
      geoCoder.reverseGeocodeLocation(location, completionHandler: { (placemarks, error) -> Void in
        
         var placeMark: CLPlacemark!
         placeMark = placemarks?[0]
        var adressString : String = ""
        
        if let country = placeMark.addressDictionary!["Country"] as? String {
            self.country = country
            adressString = adressString + country + ","
          
             if let city = placeMark.addressDictionary!["City"] as? String {

                adressString = adressString + city + ","
              
                
                 if let state = placeMark.addressDictionary!["State"] as? String{
               
                    adressString = adressString + state + ","
                
                     if let street = placeMark.addressDictionary!["Street"] as? String{
                        
                        let str = street
                        let streetNumber = str.components(
                            separatedBy: NSCharacterSet.decimalDigits.inverted).joined(separator: ",")
                        
                        adressString = adressString + streetNumber
                        // ZIP
                        if let zip = placeMark.addressDictionary!["ZIP"] as? String{
                            print("zip: \(zip)")
                            adressString = adressString + zip + ","
                            // Location name
                            if let locationName = placeMark?.addressDictionary?["Name"] as? String {
                                print("location Name: \(locationName)")
                                adressString = adressString + locationName + ","
                                // Street address
                                if let thoroughfare = placeMark?.addressDictionary!["Thoroughfare"] as? String {
                                    adressString = adressString + thoroughfare
                                    print("streetAddress: \(thoroughfare)")
                                }
                            }
                        }
                        
                        
                        
                     }
                 }
             }
    
         //   self.address.append(adressString)
            self.tfAddress.text = "\(adressString)"
           
            Location.shared.setAddress(address: LocationProperties(latitude: lat, longitude: long, address: adressString))
            self.setMap()
//            NotificationCenter.default.post(name: Notification.Name("GET_DATA"), object: nil, userInfo: ["data":adressString])
        }else{
            
        }
     })
 }

    
    // MARK :- Function Marker Info Window
    
//    func mapView(_ mapView: GMSMapView, markerInfoWindow marker: GMSMarker) -> UIView? {
//          let view = UIView(frame: CGRect.init(x: 0, y: 0, width: 200, height: 70))
//          view.backgroundColor = UIColor.white
//          view.layer.cornerRadius = 6
//
//          let lbl1 = UILabel(frame: CGRect.init(x:15, y:15, width: view.frame.size.width - 16, height: 15))
//          lbl1.text =
//            self.country
//
//          view.addSubview(lbl1)
//         lbl1.textAlignment = .center
//          let lbl2 = UILabel(frame: CGRect.init(x: lbl1.frame.origin.x, y: lbl1.frame.origin.y + lbl1.frame.size.height + 3, width: view.frame.size.width - 16, height: 15))
//           lbl2.text = "\(self.address)"
//           lbl2.font = UIFont.systemFont(ofSize: 14, weight: .light)
//        lbl2.textAlignment = .center
//          view.addSubview(lbl2)
//
//          return view
//      }
    
}

     // MARK :- Function FMS AutoComplete delegate Method

    extension GoogleMapVC: GMSAutocompleteViewControllerDelegate {
    func viewController(_ viewController: GMSAutocompleteViewController, didAutocompleteWith place: GMSPlace) {

        var addreString:String = ""
        addreString.append(place.name!)

        dismiss(animated: true, completion: nil)
        tfAddress.text = place.name
        
        if searching == true{
            let cord2d = CLLocationCoordinate2D(latitude: (place.coordinate.latitude), longitude: (place.coordinate.longitude))
            Location.shared.setAddress(address: LocationProperties(latitude: cord2d.latitude, longitude: cord2d.longitude, address: place.formattedAddress ?? "null"))
            self.setMap()
//            addreString.append("lat:\(cord2d.longitude)long:\(cord2d.longitude)")
            
           // address.append(addreString)
//                let marker = GMSMarker()
//                marker.position = cord2d
//                marker.title = "Location"
//                marker.snippet = place.name
//                marker.icon = UIImage(named: "default_marker")
//                marker.map = self.mapView
//                self.mapView.camera = GMSCameraPosition.camera(withTarget: cord2d, zoom: 15)
          
        }else {
            tapping = false
        }
       
    }
    
    func viewController(_ viewController: GMSAutocompleteViewController, didFailAutocompleteWithError error: Error) {
        print(error.localizedDescription)
    }
    
    func wasCancelled(_ viewController: GMSAutocompleteViewController) {
        dismiss(animated: true, completion: nil)
    }
}


class Location{
    static let shared = Location()

    var addressArray = [LocationProperties]()
    
    func setAddress(address:LocationProperties){
        addressArray.append(address)
    }
    
    func getAddresses()-> [LocationProperties]{
        return addressArray
    }
    
    func deleteAddress(at index:Int){
        addressArray.remove(at: index)
    }
}

struct LocationProperties{
    var latitude:Double
    var longitude:Double
    var address:String
}
