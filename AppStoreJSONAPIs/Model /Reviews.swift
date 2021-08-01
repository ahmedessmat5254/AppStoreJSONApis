//
//  Reviews.swift
//  AppStoreJSONAPIs
//
//  Created by Ahmed Essmat on 01/08/2021.
//

import UIKit

struct Reviews: Decodable {
    let feed: ReviewFeed
}

struct ReviewFeed: Decodable {
    var entry: [Entry]
}

struct Entry: Decodable{
    let title: Label
    let content: Label
    let author: Author
}

struct Author: Decodable {
    let name: Label
}
struct Label: Decodable {
    let label: String
}
