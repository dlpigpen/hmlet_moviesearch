//
//  NetworkManager.swift
//  MovieSearchingAssigment
//
//  Created by Duc Nguyen on 3/18/20.
//  Copyright © 2020 HMLet. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper
import ObjectMapper

public typealias MovieDBFinishHandler = (MovieSearchObject?) -> Void
public typealias GenresDBFinishHandler = (GenresObject?) -> Void

class NetworkManager {
    
    static let shared = NetworkManager()
    public struct MovieDB {
        static let key = "c15a46b5e69d3eac6c4df6da6fabaa44"
        static let rootURL = "https://api.themoviedb.org/3/"
        static let searchMethod =  MovieDB.rootURL + "search/movie"
        static let genresMethod =  MovieDB.rootURL + "genre/movie/list"
        static let baseURLThumb = "https://image.tmdb.org/t/p/w300/{xxx}"
    }
    
    
    @discardableResult public func searchMovieDB(keyword: String, resultHandler: MovieDBFinishHandler?) -> DataRequest {
        let params = ["query": keyword,
                      "api_key": MovieDB.key]
        return Alamofire.request(MovieDB.searchMethod, parameters: params)
            .responseObject{ (response: DataResponse<MovieSearchObject>) in
                resultHandler?(response.result.value)
        }
    }
    
    @discardableResult public func getGenres(lang: String = "en-US", resultHandler: GenresDBFinishHandler?) -> DataRequest {
        let params = ["api_key": MovieDB.key, "language": lang]
        return Alamofire.request(MovieDB.genresMethod, parameters: params)
            .responseObject{ (response: DataResponse<GenresObject>) in
                resultHandler?(response.result.value)
        }
    }
    
}
