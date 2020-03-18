//
//  MovieCell.swift
//  MovieSearchingAssigment
//
//  Created by Duc Nguyen on 3/18/20.
//  Copyright © 2020 HMLet. All rights reserved.
//

import Foundation
import UIKit

class MovieCell: UITableViewCell {
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblGenres: UILabel!
    @IBOutlet weak var lblScore: UILabel!
    @IBOutlet weak var btnLang: UIButton!
    @IBOutlet weak var lblDes: UILabel!
    @IBOutlet weak var imgThumb: UIImageView!
    
    func bindingData(movie: Results) {
        self.lblTitle.text = movie.title ?? ""
        self.lblGenres.text = AppState.shared.getGenreByKey(ids: movie.genreIds)
        self.lblScore.text =  "\(movie.voteAverage ?? 0.0)"
        self.btnLang.setTitle(movie.originalLanguage ?? "en", for: .normal)
        self.lblDes.text = movie.overview ?? ""
        
        let thumbPath = NetworkManager.MovieDB.baseURLThumb.replacingOccurrences(of: "{xxx}", with: movie.posterPath ?? "")
        self.imgThumb.loadImage(urlString: thumbPath)
    }
}
