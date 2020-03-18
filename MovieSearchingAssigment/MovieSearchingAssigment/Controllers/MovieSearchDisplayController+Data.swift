//
//  MovieSearchDisplayController+Data.swift
//  MovieSearchingAssigment
//
//  Created by Duc Nguyen on 3/18/20.
//  Copyright © 2020 HMLet. All rights reserved.
//

import Foundation

extension MovieSearchDisplayController {
    func requestSearchMovieDB(kw: String){
        dataRequest =  NetworkManager.shared.searchMovieDB(keyword: kw) { (result) in
            if let data = result {
                self.movies = data.results ?? []
                if self.movies.count == 0 {
                    self.tableview.setBackgroundEmpty(title: "Empty Data", subTitle: "There is no movie found. Please try with another keyword.")
                } else{
                    self.tableview.setBackgroundEmpty()
                }
                self.tableview.reloadData()
            }
        }
    }
    
    func getGenres() {
        NetworkManager.shared.getGenres { (result) in
            if let data = result {
                AppState.shared.genres = data.genres ?? []
            }
        }
    }
}
