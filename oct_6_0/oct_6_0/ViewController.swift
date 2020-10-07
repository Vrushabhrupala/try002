//
//  ViewController.swift
//  oct_6_0
//
//  Created by Vrushabh Rupala on 06/10/20.
//

import UIKit
import GoogleMaps

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var mapView: GMSMapView!
    
    @IBOutlet weak var swipeBtn: UIButton!
    
    
    private let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        
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
}



extension ViewController{
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        
        guard status == .authorizedWhenInUse else {
          return
        }
        
        locationManager.startUpdatingLocation()
          
        
        mapView.isMyLocationEnabled = true
        mapView.settings.myLocationButton = true
        
        func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
            guard let location = locations.first else {
              return
            }
              
            mapView.camera = GMSCameraPosition(target: location.coordinate, zoom: 15, bearing: 0, viewingAngle: 0)
              
            // 8
            //locationManager.stopUpdatingLocation()
          }
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
