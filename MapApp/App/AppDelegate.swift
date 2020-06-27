//
//  AppDelegate.swift
//  MapApp
//
//  Created by Abdülbaki Kaplan on 23.06.2020.
//  Copyright © 2020 Baki. All rights reserved.
//

import UIKit
import GoogleMaps

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var placeSearchCoordinator:SearchPlaceCoordinator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        GMSServices.provideAPIKey("AIzaSyC3fi3BfJARwDwb3dGbWK5Hakyo2W6ZupU")

        let navController = UINavigationController()
        
        placeSearchCoordinator = SearchPlaceCoordinator(navigationController: navController)
        placeSearchCoordinator?.navigateTo()
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navController
        window?.makeKeyAndVisible()
        
        return true
    }
    
    func setUpStartView() {

        let splashVC = SplashVC(nibName: "SplashVC", bundle: nil)
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = splashVC
        window?.makeKeyAndVisible()
    }
}

