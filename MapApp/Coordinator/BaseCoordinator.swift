//
//  BaseCoordinator.swift
//  MapApp
//
//  Created by Abdülbaki Kaplan on 27.06.2020.
//  Copyright © 2020 Baki. All rights reserved.
//

import Foundation
import UIKit

protocol BaseCoordinator {
    var childControllers: [BaseCoordinator] {get set}
    var navigationController: UINavigationController {get set}
}
