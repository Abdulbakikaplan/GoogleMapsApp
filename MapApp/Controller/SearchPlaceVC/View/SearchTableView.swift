//
//  SearchTableView.swift
//  MapApp
//
//  Created by Abdülbaki Kaplan on 27.06.2020.
//  Copyright © 2020 Baki. All rights reserved.
//

import UIKit
class SearchTableView: UITableView {
    var cellIdentifier:String{
        return Constant.placesCell
    }
    let searchController = UISearchController(searchResultsController: nil)
    var searchBar: UISearchBar { return searchController.searchBar }
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        
        self.register(UINib(nibName: "SearchResultCell",
                            bundle: nil),
                      forCellReuseIdentifier: cellIdentifier)
        
        configureSearchController()
    }
    
    func configureSearchController() {
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.dimsBackgroundDuringPresentation = true
        searchBar.placeholder = "Aramak istediğiniz mekanın adını yazın"
        self.tableHeaderView = searchController.searchBar
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
