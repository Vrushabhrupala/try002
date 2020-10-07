//
//  ViewController.swift
//  oct_6_0
//
//  Created by Vrushabh Rupala on 06/10/20.
//

import UIKit
import MapKit
import GoogleMaps
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var mapView: GMSMapView!
    @IBOutlet weak var swipeBtn: UIButton!
    
    let marker = GMSMarker()
    
    let path = GMSMutablePath()

    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
        locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
        
        
        
        //upSwipe init
        let upSwipe = UISwipeGestureRecognizer(target: self, action: #selector(upHandleSwipe))
        upSwipe.direction = .up
        self.view.addGestureRecognizer(upSwipe)
        
        //downSwipe init
        let downSwipe = UISwipeGestureRecognizer(target: self, action: #selector(downHandleSwipe))
        downSwipe.direction = .down
        self.view.addGestureRecognizer(downSwipe)
        
    }
    
    //swipeBtnFunc
    @IBAction func swipeBtnFunc(_ sender: Any) {
        //getUserLocation()
    }
    
    // upSwipe func
    @objc func upHandleSwipe(gesture: UIGestureRecognizer){
        //print("try")
        for constraint in mapView.constraints {
            if constraint.identifier == "iden" {
               constraint.constant = 300
            }
        }
        
        for constraint in self.view.constraints {
            if constraint.identifier == "button0" {
               constraint.constant = 300
            }
        }
        mapView.layoutIfNeeded()
        //self.view.layoutIfNeeded()
    }
    
    // downSwipe func
    @objc func downHandleSwipe(gesture: UIGestureRecognizer){
        //print("try")
        for constraint in mapView.constraints {
            if constraint.identifier == "iden" {
               constraint.constant = 600
            }
        }
        mapView.layoutIfNeeded()
    }
    
//    func getUserLocation(){
//        locationManager.requestAlwaysAuthorization()
//        locationManager.startUpdatingLocation()
//
//        print("x")
//    }
}



extension ViewController{
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        
        guard status == .authorizedWhenInUse else {
          return
        }
        
        locationManager.startUpdatingLocation()
          
        
        mapView.isMyLocationEnabled = true
        mapView.settings.myLocationButton = true
    }
        
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        //print("locations = \(locValue.latitude) \(locValue.longitude)")
        
        
//        marker.position = CLLocationCoordinate2D(latitude: locValue.latitude, longitude: locValue.longitude)
//        marker.map = mapView
        
        path.add(CLLocationCoordinate2D(latitude: locValue.latitude, longitude: locValue.longitude))
        let line = GMSPolyline(path: path)
        line.map = mapView
        
        
        
//        guard let location1 = locations.first else {
//          return
//        }
          
//        mapView.camera = GMSCameraPosition(target: location1.coordinate, zoom: 15, bearing: 0, viewingAngle: 0)
          
        // 8
        //locationManager.stopUpdatingLocation()
      }
    
}

//import UIKit
//import GoogleMaps
////import CoreLocation
//
//class ViewController: UIViewController {
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        let camera = GMSCameraPosition.camera(withLatitude: 23.0377104, longitude: 72.6428024, zoom: 13.0)
//        let mapView = GMSMapView.map(withFrame: self.view.frame, camera: camera)
//        self.view.addSubview(mapView)
//        mapView.isMyLocationEnabled = true
//        mapView.settings.myLocationButton = true
//
//        // Creates a marker in the center of the map.
//        let marker = GMSMarker()
//        marker.position = CLLocationCoordinate2D(latitude: 23.0377104, longitude: 72.6428024)
//        marker.title = "Home"
//        marker.snippet = "Vrushabh"
//        marker.map = mapView
//
////        self.locationManager.requestWhenInUseAuthorization()
////
////        if CLLocationManager.locationServicesEnabled(){
////            locationManager.delegate =
//
//        }
//
//  }
//
//    //let locationManager = CLLocationManager()
//
//
//    func backBtn(){
//        print("a")
//    }
//
