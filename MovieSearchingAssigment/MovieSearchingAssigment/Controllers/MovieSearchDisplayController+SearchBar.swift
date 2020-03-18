//
//  MovieSearchDisplayController+SearchBar.swift
//  MovieSearchingAssigment
//
//  Created by Duc Nguyen on 3/18/20.
//  Copyright © 2020 HMLet. All rights reserved.
//

import Foundation
import UIKit

extension MovieSearchDisplayController {
    func setupSearchView() {
        self.navigationItem.hidesSearchBarWhenScrolling = false
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.hidesNavigationBarDuringPresentation = true
        searchController.searchBar.placeholder = "Search"
        searchController.searchBar.barStyle = .default
        if #available(iOS 13.0,*) {
            searchController.searchBar.barTintColor = UIColor.green
            searchController.hidesNavigationBarDuringPresentation = false
        } else {
            searchController.hidesNavigationBarDuringPresentation = false
            searchController.searchBar.backgroundColor = UIColor.white
            searchController.searchBar.tintColor = .white
        }
        
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }
    
    var isSearchBarEmpty: Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    var isFiltering: Bool {
        return searchController.isActive
    }
}

extension MovieSearchDisplayController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        self.doSearch()
    }
    
    func doSearch() {
        let kw = self.searchController.searchBar.text ?? ""
        if kw.isEmpty == false {
            dataRequest?.cancel()
            requestSearchMovieDB(kw: kw)
        }
    }
}

extension MovieSearchDisplayController: UISearchBarDelegate {
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.searchController.isActive = false
        self.searchController.searchBar.text = ""
        self.tableview.reloadData()
        self.doSearch()
    }
}
