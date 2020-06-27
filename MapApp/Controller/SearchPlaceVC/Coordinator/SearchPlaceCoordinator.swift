//
//  SearchPlaceCoordinator.swift
//  MapApp
//
//  Created by Abdülbaki Kaplan on 27.06.2020.
//  Copyright © 2020 Baki. All rights reserved.
//

import Foundation
import UIKit

class SearchPlaceCoordinator: BaseCoordinator {
    var childControllers = [BaseCoordinator]()
    var navigationController: UINavigationController
    
    init(navigationController:UINavigationController) {
        self.navigationController = navigationController
    }
    
    func navigateTo()  {
        let searchScreen = SearchVC.instantiate()
        searchScreen.searchVCCoordiantor = self
        navigationController.pushViewController(searchScreen, animated: false)
    }
    
}
