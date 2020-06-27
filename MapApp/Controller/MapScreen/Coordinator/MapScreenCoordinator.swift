//
//  MapScreenCoordinator.swift
//  MapApp
//
//  Created by Abdülbaki Kaplan on 27.06.2020.
//  Copyright © 2020 Baki. All rights reserved.
//

import Foundation
import UIKit
class MapScreenCoordinator: BaseCoordinator {
    var childControllers = [BaseCoordinator]()
    var navigationController: UINavigationController
    
    init(navigationController:UINavigationController) {
        self.navigationController = navigationController
    }
    
    func navigate(with data:PlaceModel)  {
        let mapVC = MapScreenVC.instantiate()
        mapVC.mapScreenCoordinator = self
        mapVC.placeModel = data
        navigationController.pushViewController(mapVC, animated: true)
    }
}
