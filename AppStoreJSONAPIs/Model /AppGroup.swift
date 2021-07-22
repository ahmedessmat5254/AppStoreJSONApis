//
//  AppGroup.swift
//  AppStoreJSONAPIs
//
//  Created by Ahmed Essmat on 22/07/2021.
//

import UIKit

struct AppGroup: Decodable {
    let feed: Feed
}

struct Feed: Decodable {
    let title: String
    let results: [FeedResult]
}

struct FeedResult: Decodable {
    
    let artistName, name, artworkUrl100: String
}
