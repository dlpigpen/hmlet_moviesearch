//
//  MovieSearchDisplayController.swift
//  MovieSearchingAssigment
//
//  Created by Duc Nguyen on 3/18/20.
//  Copyright © 2020 HMLet. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

class MovieSearchDisplayController: UIViewController {
    
    @IBOutlet weak var tableview: UITableView!
    let searchController = UISearchController(searchResultsController: nil)
    let identifierCell = "MovieCell"
    var dataRequest : DataRequest?
    lazy var movies = [Results]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Search"
        
        self.getGenres()
        self.setupTableView()
        self.setupSearchView()
    }
}
