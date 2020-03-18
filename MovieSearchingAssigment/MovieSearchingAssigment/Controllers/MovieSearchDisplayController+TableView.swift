//
//  MovieSearchDisplayController+TableView.swift
//  MovieSearchingAssigment
//
//  Created by Duc Nguyen on 3/18/20.
//  Copyright © 2020 HMLet. All rights reserved.
//

import Foundation
import UIKit

extension MovieSearchDisplayController {
    func setupTableView(){
        let nib = UINib(nibName: "MovieCell", bundle: nil)
        self.tableview.register(nib, forCellReuseIdentifier: identifierCell)
    }
}

extension MovieSearchDisplayController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let nMovies = movies.count
        return nMovies
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: identifierCell) as! MovieCell
        let movie = self.movies[indexPath.row]
        cell.bindingData(movie: movie)
        return cell
    }
}


extension MovieSearchDisplayController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
     
    }
}
