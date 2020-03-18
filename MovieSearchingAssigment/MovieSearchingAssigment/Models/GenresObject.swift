//
//  GenresObject.swift
//
//  Created by HMLet on 3/18/20
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public struct GenresObject: Mappable {
    
    // MARK: Declaration for string constants to be used to decode and also serialize.
    private struct SerializationKeys {
        static let genres = "genres"
    }
    
    // MARK: Properties
    public var genres: [Genres]?
    
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
        genres <- map[SerializationKeys.genres]
    }
    
    /// Generates description of the object in the form of a NSDictionary.
    ///
    /// - returns: A Key value pair containing all valid values in the object.
    public func dictionaryRepresentation() -> [String: Any] {
        var dictionary: [String: Any] = [:]
        if let value = genres { dictionary[SerializationKeys.genres] = value.map { $0.dictionaryRepresentation() } }
        return dictionary
    }
    
}
