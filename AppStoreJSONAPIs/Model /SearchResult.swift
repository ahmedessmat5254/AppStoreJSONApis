//
//  SearchResult.swift
//  AppStoreJSONAPIs
//
//  Created by Ahmed Essmat on 08/07/2021.
//

import Foundation

struct SearchResult: Decodable {
    let resultCount: Int
    let results: [Result]
}

struct Result: Decodable {
    let trackId: Int
    let trackName: String
    let primaryGenreName: String
    var averageUserRating: Float?
    var screenshotUrls: [String]
    let artworkUrl60: String?
    var formattedPrice: String?
    let description: String
    var releaseNotes: String?
}
