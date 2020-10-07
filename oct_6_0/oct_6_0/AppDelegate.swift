//
//  AppDelegate.swift
//  oct_6_0
//
//  Created by Vrushabh Rupala on 06/10/20.
//
import UIKit
import GoogleMaps

let googleApiKey = "AIzaSyAdL44M1a7SflDNSeZn3JCbazw1moORYCM"

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

    GMSServices.provideAPIKey(googleApiKey)
    return true
  }

}
