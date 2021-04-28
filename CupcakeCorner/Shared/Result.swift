//
//  Result.swift
//  CupcakeCorner
//
//  Created by Ognyanka Boneva on 28.04.21.
//

import Foundation

struct Response: Codable {
    var results: [Result]
}

struct Result: Codable {
    var trackId: Int
    var trackName: String
    var collectionName: String
}
