//
//  Results.swift
//
//  Created by HMLet on 3/18/20
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public struct Results: Mappable {
    
    // MARK: Declaration for string constants to be used to decode and also serialize.
    private struct SerializationKeys {
        static let posterPath = "poster_path"
        static let backdropPath = "backdrop_path"
        static let genreIds = "genre_ids"
        static let voteCount = "vote_count"
        static let overview = "overview"
        static let originalTitle = "original_title"
        static let popularity = "popularity"
        static let releaseDate = "release_date"
        static let id = "id"
        static let video = "video"
        static let originalLanguage = "original_language"
        static let voteAverage = "vote_average"
        static let title = "title"
        static let adult = "adult"
    }
    
    // MARK: Properties
    public var posterPath: String?
    public var backdropPath: String?
    public var genreIds: [Int]?
    public var voteCount: Int?
    public var overview: String?
    public var originalTitle: String?
    public var popularity: Float?
    public var releaseDate: String?
    public var id: Int?
    public var video: Bool? = false
    public var originalLanguage: String?
    public var voteAverage: Float?
    public var title: String?
    public var adult: Bool? = false
    
    // MARK: ObjectMapper Initializers
    /// Map a JSON object to this class using ObjectMapper.
    ///
    /// - parameter map: A mapping from ObjectMapper.
    public init?(map: Map){
    }
    
    /// Map a JSON object to this class using ObjectMapper.
    ///
    /// - parameter map: A mapping from ObjectMapper.
    public mutating func mapping(map: Map) {
        posterPath <- map[SerializationKeys.posterPath]
        backdropPath <- map[SerializationKeys.backdropPath]
        genreIds <- map[SerializationKeys.genreIds]
        voteCount <- map[SerializationKeys.voteCount]
        overview <- map[SerializationKeys.overview]
        originalTitle <- map[SerializationKeys.originalTitle]
        popularity <- map[SerializationKeys.popularity]
        releaseDate <- map[SerializationKeys.releaseDate]
        id <- map[SerializationKeys.id]
        video <- map[SerializationKeys.video]
        originalLanguage <- map[SerializationKeys.originalLanguage]
        voteAverage <- map[SerializationKeys.voteAverage]
        title <- map[SerializationKeys.title]
        adult <- map[SerializationKeys.adult]
    }
    
    /// Generates description of the object in the form of a NSDictionary.
    ///
    /// - returns: A Key value pair containing all valid values in the object.
    public func dictionaryRepresentation() -> [String: Any] {
        var dictionary: [String: Any] = [:]
        if let value = posterPath { dictionary[SerializationKeys.posterPath] = value }
        if let value = backdropPath { dictionary[SerializationKeys.backdropPath] = value }
        if let value = genreIds { dictionary[SerializationKeys.genreIds] = value }
        if let value = voteCount { dictionary[SerializationKeys.voteCount] = value }
        if let value = overview { dictionary[SerializationKeys.overview] = value }
        if let value = originalTitle { dictionary[SerializationKeys.originalTitle] = value }
        if let value = popularity { dictionary[SerializationKeys.popularity] = value }
        if let value = releaseDate { dictionary[SerializationKeys.releaseDate] = value }
        if let value = id { dictionary[SerializationKeys.id] = value }
        dictionary[SerializationKeys.video] = video
        if let value = originalLanguage { dictionary[SerializationKeys.originalLanguage] = value }
        if let value = voteAverage { dictionary[SerializationKeys.voteAverage] = value }
        if let value = title { dictionary[SerializationKeys.title] = value }
        dictionary[SerializationKeys.adult] = adult
        return dictionary
    }
    
}
