//
//  ViewController.swift
//  oct_6_0
//
//  Created by Vrushabh Rupala on 06/10/20.
//

import UIKit
import GoogleMaps
//import CoreLocation

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let camera = GMSCameraPosition.camera(withLatitude: 23.0377104, longitude: 72.6428024, zoom: 13.0)
        let mapView = GMSMapView.map(withFrame: self.view.frame, camera: camera)
        self.view.addSubview(mapView)
        mapView.isMyLocationEnabled = true
        mapView.settings.myLocationButton = true

        // Creates a marker in the center of the map.
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: 23.0377104, longitude: 72.6428024)
        marker.title = "Home"
        marker.snippet = "Vrushabh"
        marker.map = mapView
        
//        self.locationManager.requestWhenInUseAuthorization()
//
//        if CLLocationManager.locationServicesEnabled(){
//            locationManager.delegate =
            
        }
        
  }
    
    //let locationManager = CLLocationManager()
    
    
    func backBtn(){
        print("a")
    }

