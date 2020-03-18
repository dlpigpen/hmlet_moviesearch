//
//  AppState.swift
//  MovieSearchingAssigment
//
//  Created by Duc Nguyen on 3/18/20.
//  Copyright © 2020 HMLet. All rights reserved.
//

import Foundation

class AppState {
    
    static let shared = AppState()
    var genres: [Genres] = []
    
    
    /// Send a list ids to a genre name joined by |
    func getGenreByKey(ids: [Int]?) -> String {
        guard let genreIds = ids else {
            return "Unknown"
        }
        
        var arr = [String]()
        for genID in genreIds {
            let geneName = self.genres.filter { $0.id == genID }.first?.name
            if geneName != nil {
                arr.append(geneName!)
            }
        }
        let genre = arr.joined(separator: " | ")
        return genre
    }
}
