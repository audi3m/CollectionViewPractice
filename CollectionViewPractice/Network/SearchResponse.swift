//
//  SearchResponse.swift
//  CollectionViewPractice
//
//  Created by J Oh on 9/13/24.
//

import Foundation

struct SearchResponse: Decodable, Sequence {
    let results: [Apps]
    
    func makeIterator() -> Array<Apps>.Iterator {
        return results.makeIterator()
    }
}

struct Apps: Decodable, Hashable {
    let screenshotUrls: [String]
    let icon60: String
    let corpName: String
    let genres: [String]
    let appTitle: String
    let version: String
    let currentVersionReleaseDate: String
    
    enum CodingKeys: String, CodingKey {
        case screenshotUrls
        case icon60 = "artworkUrl60"
        case corpName = "artistName"
        case genres
        case appTitle = "trackName"
        case version
        case currentVersionReleaseDate
//        case releaseNotes
    }
    
    func threeURLs() -> [URL?] {
        return screenshotUrls.prefix(3).map { URL(string: $0) }
    }
    
    func allURLs() -> [URL?] {
        return screenshotUrls.map { URL(string: $0) }
    }
    
}

