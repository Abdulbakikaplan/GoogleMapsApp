//
//  UITableView.swift
//  MapApp
//
//  Created by Abdülbaki Kaplan on 27.06.2020.
//  Copyright © 2020 Baki. All rights reserved.
//

import Foundation
import UIKit

extension UITableView {
    func registerCell(_ identifier: String){
        register(UINib(nibName: identifier, bundle: nil), forCellReuseIdentifier: identifier)
    }
}
