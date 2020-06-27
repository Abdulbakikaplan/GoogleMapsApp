//
//  PlaceDetailCoordinator.swift
//  MapApp
//
//  Created by Abdülbaki Kaplan on 27.06.2020.
//  Copyright © 2020 Baki. All rights reserved.
//

import Foundation
import UIKit
class PlaceDetailCoordinator: BaseCoordinator {
    var childControllers = [BaseCoordinator]()
    var navigationController: UINavigationController
    
    init(navigationController:UINavigationController) {
        self.navigationController = navigationController
    }
    
    func navigate(with data:PlaceModel)  {
        let placeDetail = SearchPlaceDetailVC.instantiate()
        placeDetail.placeDetailCoordinator = self
        placeDetail.placeModel = data
        navigationController.pushViewController(placeDetail, animated: true)
    }
}
